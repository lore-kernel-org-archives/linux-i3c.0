Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96CFFD3ABEF
	for <linux-i3c@archiver.kernel.org>; Mon,  8 Dec 2025 07:14:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=x5ex6Z9/dHwBmLJaKsCA1wG89cmI3l7Gq9rITdvtXuk=; b=ufl6dJn5ct1RQF
	wYl8se9+rZ6WeQ4SZe/DsdCb7rJVSgcn3lCPnOUrYA3HWSwAacROxnXy+56FinFJ7dECCjafh/qm9
	Q8UBePLnIVV76Xw3RG6P5o7HftP2jXClYlvMcNkR2FTrfMrGNxRkaOxCAPSZyOBMiZ1wVq7FQWVwB
	jxP27bxmImAtjVIe1dnjWbCpUSls/F4XQ8Gz+/aMgSI2A5JpXl2Ch8X64JHsxYPLOSWSC/302xj4u
	HpmmfJUOxLNYWfclJzAj2SyLR8MqNXCEch9eN4MfWYwTlH2CdmDYoWHXW7O3RK0Gyr0ik5mLjLs4+
	AaxgNZb50LtjQ9OHihhw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vSVRa-0000000CjeE-0wgY;
	Mon, 08 Dec 2025 07:14:02 +0000
Received: from mail-westcentralusazon11010030.outbound.protection.outlook.com ([40.93.198.30] helo=CY7PR03CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vSVRX-0000000Cjcm-0QvT
	for linux-i3c@lists.infradead.org;
	Mon, 08 Dec 2025 07:14:00 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=l5jl9aegAUUa+YJpTEbkPcfcq7A2W4DZ2rHuwUOukkEEKT54oGYMYRkrkBjEDYI6jl+7PREGSjskojllg/ZYUL24+ps/vow/YrIb8O7/XXFXhY9cu5qgjM6YcglCVjOr6VFUyS/K1jZ58m+F8w8qgc3LvGCXDKSIC1ZIZUZl8WYgy2VABnwqS06LRu82iXsydqahPQfmhAuuhQEBh8dOICvBdt7IIPkFvtKBkvnCUg15z46EG8tWWbA1owt/Vocnoo+dhV5MdJJ2zfqX0TfEEyJK7LOZCMTO4JhfM4qoM7/aDHXXmflWAjBnNCklCH+HaUI1iwn3lDrnqPRdRPJVUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TxwhyhjpwlrZSXp+t7+11/myxJE0f4fOrQA7wReXWpE=;
 b=B0CQGZfqhslM1djVZUHV7lXdAcbvrFbMt+wDawZjMTalw3aEyLog+WTtGsECHzIz7mPEyLE3ZpGRHuZtpZxOOS6oeSTbVChthDVATgWDhqxOn1T/VwD/P7kFllBVWQEJF1XOGs3iaMth4LHxZAQI2JCLqfvqKipE0EHYSbLxxwCbAzZcpGmwLp002lxEGWpKj3lJKLcmA53FFs97/YhVFRPek2vipZJnggaStsItQY/F0gkD0E4g9Kp3aAtb6tP3x0pGVCJy+7y7UzrAK3kQpSkq7GqLrtoKK6t2dEr7kml6LE9dnzqJxeOArrT8VwBbXYfipL9A1Be6O8icXtedIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=altera.com; dmarc=pass action=none header.from=altera.com;
 dkim=pass header.d=altera.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=altera.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TxwhyhjpwlrZSXp+t7+11/myxJE0f4fOrQA7wReXWpE=;
 b=nKwS9Ryjw9vPaygSyDoh6yuXi0zzkRtm3E4Fie50UIFx5c524iGjXruuoif7y5qVy4UyIsdy6SnUnLh7mLD3Mba0zZLoAEk15yFqVYw42SEYAi6TGQyRCZMUHLA71kSlyhyEdMUEne4XGjT/AExNo98Cns+hMNxnElwjyEHm5FgrgBYA5I51RZXIhDY9Yv4vDcY1AH0XTxXZd0vez8kvHSReg6arqjVMN7oBZn5gCUoFmBLVgl6rHWM9ng7lJFjVE0ICPDWW1hEMmWEcNcB9NqGLty06Ym5iU1+RXlHYYW1CviVqn4dcqe+9+tHOlsNG3uV+gGrvJav9UlhxzwI/jA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=altera.com;
Received: from DM8PR03MB6230.namprd03.prod.outlook.com (2603:10b6:8:3c::13) by
 SJ2PR03MB7475.namprd03.prod.outlook.com (2603:10b6:a03:55b::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.14; Mon, 8 Dec
 2025 07:13:52 +0000
Received: from DM8PR03MB6230.namprd03.prod.outlook.com
 ([fe80::abad:9d80:7a13:9542]) by DM8PR03MB6230.namprd03.prod.outlook.com
 ([fe80::abad:9d80:7a13:9542%3]) with mapi id 15.20.9388.013; Mon, 8 Dec 2025
 07:13:52 +0000
From: adrianhoyin.ng@altera.com
To: alexandre.belloni@bootlin.com,
	Frank.Li@nxp.com,
	linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: adrianhoyin.ng@altera.com
Subject: [PATCH v7 0/5] i3c: dw-i3c: Enable support for dw-i3c controller NACK retry sysfs and DAT restore fix
Date: Mon,  8 Dec 2025 15:11:15 +0800
Message-ID: <cover.1765177110.git.adrianhoyin.ng@altera.com>
X-Mailer: git-send-email 2.49.GIT
X-ClientProxiedBy: KU0P306CA0060.MYSP306.PROD.OUTLOOK.COM
 (2603:1096:d10:23::7) To DM8PR03MB6230.namprd03.prod.outlook.com
 (2603:10b6:8:3c::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM8PR03MB6230:EE_|SJ2PR03MB7475:EE_
X-MS-Office365-Filtering-Correlation-Id: ebbb6277-a486-4840-ac67-08de3629572b
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?P+5FEZJdqaYQpB6l+q64el486IgoNDImSobgBVzRJ8pMVsuw/mlWQEvOGKhn?=
 =?us-ascii?Q?EsNXaJ8VEftSy0aM0Duoa23c69iWzbSytBvMcjmcMT2hP7WOSFEYez0Jd3v/?=
 =?us-ascii?Q?tVESMGp0p2xo4OIn/w4JF6+Ekw/chcKY0Y6jj5y2zWVgeaXA/8p7c3Bl5kip?=
 =?us-ascii?Q?Ylu9OiF8F1cry1fRUJrTFZ9nluwfmQSGjgdJVgDNRmPeH3Cc707roBRoqTm6?=
 =?us-ascii?Q?BZuJ1RGLy2IQHbnXLWccPq3CXknGB+BBH/zmWmYJLqCdEanZIoN6cixfJOQB?=
 =?us-ascii?Q?brIEY2SumqV8NncIVnVMgT3G27ydhTsoEFfnO//F/Dg46c1AP+MK+ffpRqrc?=
 =?us-ascii?Q?e3RmPb8BOOPRaaC7+SQEWYmRdKqREWhbOT7SINFAOS0sThdg5VfbZvmSNPnx?=
 =?us-ascii?Q?jD6tYL9y+WB5IgkVwIVB2SyF8KpIf/M1KZh7zrXQVz8LWgpNHLdrpp/O/ntd?=
 =?us-ascii?Q?mHrmqJEZHLR2saxkr+5eRaI0HOJxuyjFhTL7yGYGewJ9Lu4/TczwVBgcDml/?=
 =?us-ascii?Q?FOpGUyjBduIXUTB+LubK5a2zOMp4+y2X7D2YUu8E5abpdqLoYDMQ3FRgHSr7?=
 =?us-ascii?Q?JjAQOl1jC0N6kEr2mpjJUBsI8utOvZ1020U1xIpBrBH/XvxcPYDu2bPkNrZy?=
 =?us-ascii?Q?PKVVxNG/U3WsdKnODQCV7pbX+wqunmvqNxJOWc+cjwnhm/kSdYp2y+c7h9ym?=
 =?us-ascii?Q?B5V89xcZGZwb1gAwHVjvcQ2qZIOg/9iawnBcxucWvl9HZEeEDYxjtNEzRc+u?=
 =?us-ascii?Q?ccdUQjNSPqs8dhlRCDe8VxmjLrhZRmYP/TNxGw9ctxqZRMm1vTaa3galRz0Q?=
 =?us-ascii?Q?jhwxEfEOy9pkyvV5Pk7FizV6vXMXJtH4g9mv/boKQNFctYVWF++S84zyO/PD?=
 =?us-ascii?Q?TKX1FS+sQcHbINvUu0uByLhoaoHPGbEFCUf4En6xyMOHHFtaKbdxKt12OZWb?=
 =?us-ascii?Q?hnpE61CSm9B6y3zu3xGVYpkbERKeqMJAXxsbfTiyPHoJ69128dv86Ho+Bjsu?=
 =?us-ascii?Q?4J8EmSqtkqWERmNX737rtlYF7ledbBUgGUFpD+x9kmj8sWDDUYnmRQqy19RI?=
 =?us-ascii?Q?quvLdxHuyQDeCyrGPNzVlIbIOceqmtzMs3Iu4LQ2AbFPag48xzOxMcTGqwNB?=
 =?us-ascii?Q?yT+L/QdNNCD2XvB6UAai6I5X9zBDR2qxwsv7p/NJmTstomkSDqPkroUOP/z/?=
 =?us-ascii?Q?vjN3FmZirPk9yCt/9iwFulbky6ZtEJ4q4gmtMSEy2mbeQ7gG2DDTpQbrU+yK?=
 =?us-ascii?Q?95Fma0V6D7aTfE+i9EkJbXixkXENbbjCw22EMeS8W1LdNzG0WDnwv0b1vgGV?=
 =?us-ascii?Q?Qe21LTvDr7SfqjxcE9iglbRccTx1fd0Scegemexu3BVO7CP/Pfhk6zutf9lj?=
 =?us-ascii?Q?Vyc6Qpdd3kVZujMVkJGcgA0zY+ZytALv047BllgamUWgbn/NdZm5WvHUwFaM?=
 =?us-ascii?Q?0AUm8xh+2oXiz0P9OMAx3mWJBMYj/gjLD+oThgh864H9FLNCsz5tYA=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM8PR03MB6230.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Fw4/5bGg7IehS40bly1euhGOaQUBRP4fEpgHeSRcnDd0U3UJICRfiCafyj1a?=
 =?us-ascii?Q?3+1c83MCWSZigpGnTYMOFek2qGUs0RPqbAStubEENHSjU4cgv2Rn77yQr4zW?=
 =?us-ascii?Q?vJVFUWdGyxfwb4uN+mwJCZuLeFgFR3DNJbCqyUnMbSitA7kBBqd2Pjt9Ik61?=
 =?us-ascii?Q?RZuBQUGH3VxQRVy1Cd97sF0//32tGQMgYWOC33kX2Y/hwTdiGfZeQp7/y7IX?=
 =?us-ascii?Q?5e5xtNauEOFjNgBPQ0xgKt9uO41yL97wA1mCjGXIJfzCoCHdjj9VofhT6qy2?=
 =?us-ascii?Q?wAZWY4eOpxjF2mobUQ2ffwHYAQWvP/3C54dSQYhBFNWW5nWgBtlfoqrUdV8W?=
 =?us-ascii?Q?nqq26a+69hS1hQ7eQnjmfTKyU49s4uCI1rA4H1qqKfICQRHvsTvK2Fl9S40u?=
 =?us-ascii?Q?vJoNpGxrg19ITuZXbV9NxzcsjNbcWh5Rkbl+45HIV5AEdFNf4R7tFat3HQ4j?=
 =?us-ascii?Q?rFDzPkb1ixOlbttscH7w7HZI/puibu4xXhiwdmX1dYqDCxtrtvUyvHsvmNU8?=
 =?us-ascii?Q?wGVpc8vRpvQwh6iyDrXWvsX/Jc9loJ3dWS1umViH6aTWK7ylqV0uLEIc5IIV?=
 =?us-ascii?Q?afzeMCQe2NDBt3An+Nwv6Alm3rgolQbgwcWvaXearr5sa2upDtzUWtjZEi5n?=
 =?us-ascii?Q?ef405CdOdoIyfY6EqanYqCWiHfvhfFrySQo/TYzAIJocBWd92wUpv7AZo8ME?=
 =?us-ascii?Q?EL/LCXygWPFbdEf2RUvOBKcWr+3YqoKBiUAqhnmOsZ0xzYG0B2Wg0BbHBF7g?=
 =?us-ascii?Q?c2Ne9RNskkzAo4FeL8OzpIdAwarQgdUGM4oL6jfVxzMivPr5gi1mKVHLYxaQ?=
 =?us-ascii?Q?jA/0TQ16V9QXspqP7Cjcq1XDJLxn1YAj0HU93mqNwTz3R9ESdgPOXFANkA59?=
 =?us-ascii?Q?M+XMY+Me3Lv3qeCEkgPZqPcVt6IhBvHRuzvC2DQJfzirDcK4sHYSGqM9q+/u?=
 =?us-ascii?Q?bs+2S6aMB3S/w7Y7AVd/+V0x0fMd2pHSh5TAF70dLGevkGcKrms7rhthQp3u?=
 =?us-ascii?Q?FUOz5aoO79WUUqnODonzwg708mcSa5rPqCAGrd4PXjVfxJEghFK7aoUbLzXj?=
 =?us-ascii?Q?XmBjrZkxbTrZLWJPMIPblJAeSWwtZGRkqFbrmWc3MdtdmFKKeHJUBkIrZobG?=
 =?us-ascii?Q?WSjBMJv2HSrfQWrI6mdS6TlichY4/JssZi3vR/o2wETbr5MqtAUbtNKKvkB1?=
 =?us-ascii?Q?yC8/fW8iRidAtjarVNE4+SNwshhV/v+UNpZYo84UuGmBk4rrxjmOtJyaAHq3?=
 =?us-ascii?Q?vhme7s+XI3ioc7aC2E2pLDHjEdNpGW1R+7TYHGC9qihsJyRtpYOSqUtDtjGm?=
 =?us-ascii?Q?9/x21iTFFjS3MYgZTMk7VSVxj8U4lDGFdTeMsZIrh8Au+NsFJ1PKxIHXFYPJ?=
 =?us-ascii?Q?XX/KTNsF8hdQiV6rwOl0MzVpiHKsVhvqsfjfuQOQl+t7wIiUdEU0Gjce/y+Q?=
 =?us-ascii?Q?Xbb27DV4oMwrvO7TWiAow9frOZ8rBCRGHAChVuZSlPv2vF9D4NLM9xjvFG6l?=
 =?us-ascii?Q?mL0BawXvK6iSl87D5dqvp0AngSqQoRFsFn+MkSN8DC3ewOeOB1ROqNGGkJeu?=
 =?us-ascii?Q?3nldCGHI8s8msk4kSq/M7WLUdS5Xn4aGAqHRE1VTxPrrRGsAb1KdsGDzHqcw?=
 =?us-ascii?Q?3Q=3D=3D?=
X-OriginatorOrg: altera.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ebbb6277-a486-4840-ac67-08de3629572b
X-MS-Exchange-CrossTenant-AuthSource: DM8PR03MB6230.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Dec 2025 07:13:52.0251
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fbd72e03-d4a5-4110-adce-614d51f2077a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uZSsVIv5t6/0+BPztoYhtIWKKbz2sjJ1inr3/rRcHxIcCYFfe3+v3YJuxWKH6V+rujX6xr20NdoilU3OlIfobKlqznxsDXh8yzLHuLIKGvg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR03MB7475
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251207_231359_162505_392C4A0E 
X-CRM114-Status: GOOD (  11.37  )
X-BeenThere: linux-i3c@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-i3c.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-i3c>,
 <mailto:linux-i3c-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-i3c/>
List-Post: <mailto:linux-i3c@lists.infradead.org>
List-Help: <mailto:linux-i3c-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-i3c>,
 <mailto:linux-i3c-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org

From: Adrian Ng Ho Yin <adrianhoyin.ng@altera.com>

This patch series adds a controller-wide sysfs attribute
dev_nack_retry_count for the DesignWare I3C controller, allowing runtime
control of the automatic retry mechanism when a device NACKs. Some I3C
slave devices may temporarily be busy and unable to respond immediately;
automatic retries improve robustness in such cases. Writes are clamped to
the hardware maximum of 3, and the value is applied to all active DAT
entries.

The series also fixes dw_i3c_master_restore_addrs() to preserve existing
DAT entry bits, preventing overwrites during runtime PM resume.
---
changelog:
v6->v7
* Update dev_nack_retry_show to remove redundant i3cbus variable.
* Refactor dev_nack_retry_store to store dev_nack_retry val only if
  set_dev_nack_retry does not return error.
* Update set_dev_nack_retry in master and dw-i3c-master to take
  additional param which is the dev_nack_retry_cnt.

v6 patch link:
https://lore.kernel.org/all/cover.1764746266.git.adrianhoyin.ng@altera.com/

v5->v6
* Use dev_to_i3cmaster to get i3cmaster insteasd of direct assignment.
* Remove redundant set_dev_nack_retry callback function check.
* Update kernel doc for set_dev_nack_retry.
* Add macro for dev nack retry mask.

v5 patch link:
https://lore.kernel.org/all/cover.1764663888.git.adrianhoyin.ng@altera.com/

v4->v5
* Revert changes that made bus_maintenance_lock and
  bus_maintenance_unlock helpers public.
* Move dev_nack_retry sysfs attribute to master.c; create it only if
  the master implements the dev_nack_retry callback.
* Add dev_nack_retry field to i3c_master_controller; updates are applied
  under bus maintenance lock.
* Add optional ops to configure dev_nack_retry in the DAT entry in
  dw-i3c-master.

v4 patch link:
https://lore.kernel.org/all/cover.1764571045.git.adrianhoyin.ng@altera.com/

v3->v4
* Make bus_maintenance_lock and bus_maintenance_unlock helpers public.
* Replace taking spinlock during DAT update with bus_maintenance_lock.
* Add macro for static and dynamic addr for device addr table.
* Replace GENMASK calls with the appropriate macros when updating addr
  table.

v3 patch link:
https://lore.kernel.org/all/cover.1763747151.git.adrianhoyin.ng@altera.com/

v2->v3
* Update commit message for better clarity
* Update function name to maintain consistency.
* Update store function to return error when retry value exceeds hw limit.
* Add lock to protect DAT to avoid concurrent during transfers.
* Clear the address field in the DAT entry before setting new values to
  ensure correct dynamic/static address configuration

v2 patch link:
https://lore.kernel.org/all/cover.1763703573.git.adrianhoyin.ng@altera.com/

v1->v2
* Drop dev_nack_retry_cnt binding and device tree changes.
* Update commit message for better clarity.
* Update to use controller wide sysfs attribute that configures
  dev_nack_retry_cnt during runtime.

v1 patch link:
https://lore.kernel.org/all/cover.1762245890.git.adrianhoyin.ng@altera.com/
---

Adrian Ng Ho Yin (5):
  i3c: add sysfs entry for Device NACK Retry count
  i3c: add sysfs attribute for device NACK retry
  i3c: dw: Add support for Device NACK Retry configuration
  i3c: dw: use FIELD_PREP for device address table macros
  i3c: dw: Preserve DAT entry bits when restoring addresses

 Documentation/ABI/testing/sysfs-bus-i3c | 12 +++++
 drivers/i3c/master.c                    | 38 ++++++++++++++++
 drivers/i3c/master/dw-i3c-master.c      | 59 ++++++++++++++++++++++---
 include/linux/i3c/master.h              |  6 +++
 4 files changed, 109 insertions(+), 6 deletions(-)

-- 
2.49.GIT


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
