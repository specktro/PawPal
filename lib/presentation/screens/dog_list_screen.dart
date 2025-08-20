import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../domain/models/dog.dart';
import '../theme/app_theme.dart';

class DogDetailScreen extends StatelessWidget {
  final Dog dog;

  const DogDetailScreen({super.key, required this.dog});

  String _formatLastVisit(DateTime lastVisit) {
    final now = DateTime.now();
    final difference = now.difference(lastVisit).inDays;
    
    if (difference == 0) {
      return 'Today';
    } else if (difference == 1) {
      return 'Yesterday';
    } else if (difference < 30) {
      return '$difference days ago';
    } else if (difference < 365) {
      final months = (difference / 30).round();
      return months == 1 ? '1 month ago' : '$months months ago';
    } else {
      final years = (difference / 365).round();
      return years == 1 ? '1 year ago' : '$years years ago';
    }
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    
    return Scaffold(
      extendBodyBehindAppBar: false,
      appBar: AppBar(
        title: Text(dog.name),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () {
            HapticFeedback.selectionClick();
            Navigator.of(context).pop();
          },
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.edit),
            onPressed: () {
              HapticFeedback.lightImpact();
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Edit feature coming soon!'),
                  backgroundColor: AppTheme.primaryCoral,
                ),
              );
            },
          ),
        ],
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: isDark 
              ? [AppTheme.darkBackground, AppTheme.darkSurface]
              : [AppTheme.lightBackground, AppTheme.lightSurface],
          ),
        ),
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Pet Avatar Section
              Container(
                width: 120,
                height: 120,
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [AppTheme.primaryCoral, AppTheme.primaryPeach],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.circular(60),
                  boxShadow: [
                    BoxShadow(
                      color: AppTheme.primaryCoral.withOpacity(0.4),
                      blurRadius: 20,
                      offset: const Offset(0, 8),
                    ),
                  ],
                ),
                child: Center(
                  child: Text(
                    dog.profileImage,
                    style: const TextStyle(fontSize: 60),
                  ),
                ),
              ),
              
              const SizedBox(height: 24),
              
              // Pet Name and Status
              Text(
                dog.name,
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: isDark ? AppTheme.darkTextPrimary : AppTheme.lightTextPrimary,
                ),
              ),
              
              const SizedBox(height: 8),
              
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                decoration: BoxDecoration(
                  color: AppTheme.getStatusBackgroundColor(dog.healthStatus, isDark),
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(
                    color: AppTheme.getStatusBorderColor(dog.healthStatus, isDark),
                    width: 1.5,
                  ),
                ),
                child: Text(
                  dog.healthStatus,
                  style: TextStyle(
                    color: AppTheme.getStatusTextColor(dog.healthStatus, isDark),
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              
              const SizedBox(height: 32),
              
              // Information Cards
              _buildInfoCard(
                'Basic Information',
                [
                  _InfoItem('Breed', dog.breed),
                  _InfoItem('Age', '${dog.age} years old'),
                  _InfoItem('Color', dog.color),
                  _InfoItem('Weight', '${dog.weight} kg'),
                ],
                isDark,
              ),
              
              const SizedBox(height: 16),
              
              _buildInfoCard(
                'Owner Information',
                [
                  _InfoItem('Owner', dog.ownerName),
                  _InfoItem('Last Visit', _formatLastVisit(dog.lastVisit)),
                ],
                isDark,
              ),
              
              const SizedBox(height: 16),
              
              _buildVaccinationCard(isDark),
              
              const SizedBox(height: 32),
              
              // Action Buttons
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton.icon(
                      onPressed: () {
                        HapticFeedback.lightImpact();
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Schedule appointment feature coming soon!'),
                            backgroundColor: AppTheme.primaryCoral,
                          ),
                        );
                      },
                      icon: const Icon(Icons.calendar_today),
                      label: const Text('Schedule'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppTheme.primaryCoral,
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: OutlinedButton.icon(
                      onPressed: () {
                        HapticFeedback.lightImpact();
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Medical records feature coming soon!'),
                            backgroundColor: AppTheme.primaryCoral,
                          ),
                        );
                      },
                      icon: const Icon(Icons.medical_services_outlined),
                      label: const Text('Records'),
                      style: OutlinedButton.styleFrom(
                        foregroundColor: AppTheme.primaryCoral,
                        side: const BorderSide(color: AppTheme.primaryCoral, width: 2),
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              
              const SizedBox(height: 100), // Extra space for better scrolling
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildInfoCard(String title, List<_InfoItem> items, bool isDark) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: isDark 
          ? AppTheme.darkCardBackground.withOpacity(0.8)
          : AppTheme.lightCardBackground.withOpacity(0.9),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: AppTheme.primaryCoral.withOpacity(isDark ? 0.3 : 0.2),
          width: 1,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(isDark ? 0.3 : 0.1),
            blurRadius: isDark ? 8 : 6,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: isDark ? AppTheme.darkTextPrimary : AppTheme.lightTextPrimary,
            ),
          ),
          const SizedBox(height: 16),
          ...items.map((item) => Padding(
            padding: const EdgeInsets.only(bottom: 12),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: 80,
                  child: Text(
                    '${item.label}:',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: isDark ? AppTheme.darkTextSecondary : AppTheme.lightTextSecondary,
                    ),
                  ),
                ),
                Expanded(
                  child: Text(
                    item.value,
                    style: TextStyle(
                      fontSize: 16,
                      color: isDark ? AppTheme.darkTextPrimary : AppTheme.lightTextPrimary,
                    ),
                  ),
                ),
              ],
            ),
          )),
        ],
      ),
    );
  }

  Widget _buildVaccinationCard(bool isDark) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: isDark 
          ? AppTheme.darkCardBackground.withOpacity(0.8)
          : AppTheme.lightCardBackground.withOpacity(0.9),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: AppTheme.primaryCoral.withOpacity(isDark ? 0.3 : 0.2),
          width: 1,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(isDark ? 0.3 : 0.1),
            blurRadius: isDark ? 8 : 6,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(
                Icons.vaccines,
                color: AppTheme.primaryCoral,
                size: 24,
              ),
              const SizedBox(width: 8),
              Text(
                'Vaccinations',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: isDark ? AppTheme.darkTextPrimary : AppTheme.lightTextPrimary,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          ...dog.vaccinations.map((vaccination) => Container(
            margin: const EdgeInsets.only(bottom: 8),
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            decoration: BoxDecoration(
              color: AppTheme.primaryCoral.withOpacity(0.1),
              borderRadius: BorderRadius.circular(12),
              border: Border.all(
                color: AppTheme.primaryCoral.withOpacity(0.3),
                width: 1,
              ),
            ),
            child: Row(
              children: [
                Icon(
                  Icons.check_circle,
                  color: AppTheme.primaryCoral,
                  size: 16,
                ),
                const SizedBox(width: 8),
                Text(
                  vaccination,
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: isDark ? AppTheme.darkTextPrimary : AppTheme.lightTextPrimary,
                  ),
                ),
              ],
            ),
          )),
        ],
      ),
    );
  }
}

// Helper class for info items
class _InfoItem {
  final String label;
  final String value;

  _InfoItem(this.label, this.value);
}

// ==================== presentation/widgets/dog_card.dart ====================
