Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0ABEFC3DA4A
	for <linux-i3c@archiver.kernel.org>; Fri,  9 Aug 2024 15:46:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:From:
	References:Cc:To:Subject:Date:Message-ID:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=VyU60/iM38Ay4M3uuKERoNLP9F/eA3CX1dUSaag+W3g=; b=Ew1L9nxZTbI4zoHP2Ez3b82kCV
	/1kzPqW0XxeIp6RE3BLJiy7UsNggvK/plfuUxYBbicpKGzKAVzQfqMuhbY2wuc1jy2db0ywbKxmZa
	EPVqdsBkVghePBoXggfuhY0HBJFS/YWDnRfcXcTOFTKz5ORDaHWJSRDhphQKFQzQcmJO/5RvNmA2H
	lHXFS3h7ctpOvdPnvUrhkzf++6xMMqo4YH4XgHJYeZTD/J3nkqFNURiV9VzgL85q3OTzQVP1deNvO
	xhVNxsrnneFMDB6C22Mt6u1UA3v6bgzfQuSY4RDWCAsddFH2nc08QO+u1WbM51yqfIq+tAKOrdmtP
	+jkQgv1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1scRou-0000000BmDQ-2mCl;
	Fri, 09 Aug 2024 15:46:24 +0000
Received: from mail-mw2nam10on20628.outbound.protection.outlook.com ([2a01:111:f403:2412::628] helo=NAM10-MW2-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1scRor-0000000BmD3-2BBc
	for linux-i3c@lists.infradead.org;
	Fri, 09 Aug 2024 15:46:22 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EbNL7uIkpd08/FPticN//8vJ+2+BXfCdSQNEG+vL0aESiA5EvE7Ex2x/HtJV2vSjXHT98OCOyZ6qzpQ1KPfo6/iSiTS0fzUues/Kh5DUV268Cqm8pG5+rWNwvWLdTsPlgr7XS/v0g8u8blXmlyuFtNdZyxOrybcbo7JRE/sWU9+uUuxHW8ISkzpX5muX/N3GM0wI/Txq/cgGjRwjYBbjY02yhrlsRgrnvC+AT7YEH5cjR7WxDrrSw3x75s8+f8NIKb6HNBWcjEAzTco8SLTuGKHeRwoHV4+odesbqx0w1CzG9yUz2kzvQfzRqy1TE0lvzUV43xcYM1Cwx1+POfKftw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JfpZYTlYR6mrqAPU1LqrqjAIshuoPV0Cyzn/NAR3BOQ=;
 b=sqXPFkr3iZkn8AqGdWjEzFUfOjKB2vBiSwHte04w/J62TRp0CQGygBei9mN9Ar9oIa3xdSoW8OSFgTMzmvOCn9PXqbOcXlg9VpZh1RlJlBertQ0vhoMgkng8v4cGoUsLnNKlCLRCvKCb7VZRATor+zqQw1KCq+psyZ1yApnezNF0RIulFmyJyl3KQARSJdGoXfTfDENmSnxYg/hQYYTM54nDbhDkEbZTWUf+k8PBfXOKYD+wa5gOkAb70PZpHbfQMV44L/N7ca07EkTm6PdLudbT8k7sUbt8G3ZcXlregu79pDxsVQRraZnGlJOwE8OOOStJsl0Hu58Uhxs0/4/oYg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JfpZYTlYR6mrqAPU1LqrqjAIshuoPV0Cyzn/NAR3BOQ=;
 b=fQyLnnHWieEdnV4/qdgCaEg1mjYS3ucxLHSlvTN7MET0qDcg9z0NeOsus4orHOLrTax6L0lRUypP3v5ZWjhO7fpkHVy1aT652oB5UlZWuDDEc6amzUEpbd4UNeAPtWyhzS3LPY+4C6BXYcg/R60CS9Q83OT4E7Vy0dJR8edhWpE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BL1PR12MB5176.namprd12.prod.outlook.com (2603:10b6:208:311::19)
 by MW6PR12MB9019.namprd12.prod.outlook.com (2603:10b6:303:23f::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7849.15; Fri, 9 Aug
 2024 15:46:08 +0000
Received: from BL1PR12MB5176.namprd12.prod.outlook.com
 ([fe80::ed5b:dd2f:995a:bcf4]) by BL1PR12MB5176.namprd12.prod.outlook.com
 ([fe80::ed5b:dd2f:995a:bcf4%4]) with mapi id 15.20.7849.015; Fri, 9 Aug 2024
 15:46:08 +0000
Message-ID: <62efb2bc-152e-4970-88b9-4d40865bc457@amd.com>
Date: Fri, 9 Aug 2024 21:16:05 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RESEND v3 2/6] i3c: mipi-i3c-hci: Read HC_CONTROL_PIO_MODE
 only after i3c hci v1.1
Content-Language: en-US
To: Jarkko Nikula <jarkko.nikula@linux.intel.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Guruvendra Punugupati <Guruvendra.Punugupati@amd.com>,
 Krishnamoorthi M <krishnamoorthi.m@amd.com>, linux-i3c@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20240807052359.290046-1-Shyam-sundar.S-k@amd.com>
 <20240807052359.290046-3-Shyam-sundar.S-k@amd.com>
 <ce725e2b-378c-46ba-86ad-a877de0e1ef4@linux.intel.com>
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
In-Reply-To: <ce725e2b-378c-46ba-86ad-a877de0e1ef4@linux.intel.com>
X-ClientProxiedBy: MA1P287CA0007.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a00:35::24) To BL1PR12MB5176.namprd12.prod.outlook.com
 (2603:10b6:208:311::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR12MB5176:EE_|MW6PR12MB9019:EE_
X-MS-Office365-Filtering-Correlation-Id: 2e784fb3-ff6f-4929-ce0e-08dcb88a62dd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?blliMmdONndObG1NbDd0cEo2Mzl5VXFRZFZiSGdZWjI5YTV3ZTVPM0VIK1h0?=
 =?utf-8?B?b3VKNjl5emNXOFlNdFBZZ1ZYSXRFWWZFdXVKenQxd0lPcHZ4UGJMekxvTEhF?=
 =?utf-8?B?SzJBYStDbGVsUHV3aXpuWVdpaVk0SkthcEJ2Y2hSYVRMTFZlMldCZ2RaUnpx?=
 =?utf-8?B?TGFNb3puNG0wbFd1RURvS3JYYXhJNm5UK2JOREdDTDE5S0tWQ1c1Vy9LZWZm?=
 =?utf-8?B?S05WVVFOaG9vWTRIWDFCdWtHeHQ2UmEvNDRFRW9PR0ttZXBhdWQvRFI0VXBa?=
 =?utf-8?B?MDNQSWJkY0pXY1NHRXMzRHR4WFJNMnpqUVNLTS9JKzlHVzJjK3VKWkd0cXhp?=
 =?utf-8?B?eXRkUzNrSzdrYk5Cem8vcVlobElPakFqOUI1cG1hU3RSMFdBREZLTGhKUzk0?=
 =?utf-8?B?SDY1RERaSjBoU0tXQmJwN2YzUjdqRXhyMmR4Z05xMHUxbm4xcVNwY2Y0Q01q?=
 =?utf-8?B?RjFvMENNdE9kbWcyWU1PTm5QaDRwUXl2eXZBdTZLY0JPajRhZ0JsSVp4c3N6?=
 =?utf-8?B?dUFYZWRFb3Q3SjFsOXQ2N2VuMldMamQwczliQzVqQUZBb3lBU2hyREFtK3NU?=
 =?utf-8?B?QXdTbXJremZUVHNsZFBxdFBObGtacXg0bnlxUE5qcFZNY3dwa0JYelJyaWZ3?=
 =?utf-8?B?bFBxSmpOSHFkVTc2cGEreG1xUnpiU2Nuc01rdVJSbWZ4V0tZb3hYZXg4UkNk?=
 =?utf-8?B?ai9OT3VwSWw2YkxQOC8vTTZqTzBHNktyRVFLVHo3cllyWm13VHdFRXdtRzFt?=
 =?utf-8?B?b3V0S0w4ZHFySjBLemY1cnJ0ZUtSR1J6LzdWR1haMXJzWE9IOVd0YWJwVWw2?=
 =?utf-8?B?RTIwbUNKM0k2alZmMWcyNXVITUFiaTFrQ0crY1dzZ0xrcXl3MWR5SXhNV1pK?=
 =?utf-8?B?MHdLdmQzUlZlMlJzWG1SVjVNamlNMVhkS0ZUK2x3N21oQ2RQZ21iWkc1ZXpk?=
 =?utf-8?B?YXhWcUNtMlJYUDNRSEJjNGVaNCtRRGVHL3A0dmpjNlR1RTdFU3dZcXZWcWhI?=
 =?utf-8?B?T3dOUkYrbDFseW14VVloV2ZPaTBvczh5TXdBUVRFN010VVAzK3lKOGFGemZW?=
 =?utf-8?B?OWRxaFpHTFluY0RseVZHaWM4T1R6dXBZbkYzS3BGYkVSeVV4RU5VMHhDY2Nu?=
 =?utf-8?B?UmdqaFNDZHpHOHpLZ1ZNVk1MeTltQUU1L1NCcG5YOFcyRTVNVGx4TURqNVdS?=
 =?utf-8?B?NGVzbDBINFlTM0pBQUd0eVVHMmt6RTVGUDUxTi9PZkw3TUNBbE1TdmZLMnpZ?=
 =?utf-8?B?RXNjY0R0YmRMYUdFNks4ZGtBQjZPcUp6Zlo5SC9BczF6Y0YrU3V0L1V3ZkpD?=
 =?utf-8?B?NzR0Y0lBQkE3bmNTZWEyaUt2cHJQblA2K0lSbGJ5RlozcG81RVVmeWxrSENz?=
 =?utf-8?B?dmtVNHJtQ05GcVUyOVJKUDBOV2trdnJHUmhEY0h4Z0tEL2ppR3RtRUVLUUZz?=
 =?utf-8?B?MlN2VEVWYW1JSEpuUk5qcVR0c3Jjdys3SzJGNC9DWHpVMDBxU1NyakZCWHlx?=
 =?utf-8?B?cm9oQ2ppSlh3M3luWFB3V1l5ejN4ZUZ1bUpydDNuL0QySW5lZE5rNVBTcFVN?=
 =?utf-8?B?ckZMQ2J5YmpjMm4yWUsrMHJMcDVCTndkRWE0d2NIRHJ5cTMzelN4YnpKaGVG?=
 =?utf-8?B?MTQ3Yi82a2VONGpFYVAvOW5ZTHlIUURycnlRUkczSlRVMDR5c0w3cFZZNU5I?=
 =?utf-8?B?ZG5aYWVSZ3ZIdU1acTEvNHFoNmt5Wm9PdmFWOUxsMDQ4Mk9CVDIwMUZTOTVh?=
 =?utf-8?B?emppQTRNZWl1VEJab0NxNk4xZklNSEUyUXBNMG5wS3N2bFdLUFVvQ1lidFRq?=
 =?utf-8?B?ZWdva2YzMVZwTVlZWTFtZz09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR12MB5176.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?d0VtR1lCVXJwbWxETStXNkxWdytqRGkycldkWEo1cm5Ya2kwOFc4RkpnZGpO?=
 =?utf-8?B?bndsMlBvdmVHVHFuRDZYOGdPS0ExT24yazMySTZPdCtGdUJ6WmJiNmhEdzFh?=
 =?utf-8?B?aHZGVVZnR3BSeTRpUmhxek1waEhQdmM2UEVoYkg1VU5TdVozeFB3MnU2QlFq?=
 =?utf-8?B?K0hqWWpRR1pMQzM2dWE4K1U5VlVKK1Ivd3BYK3BQUzQzUTI0Ym1nNUhzdkF0?=
 =?utf-8?B?S0orU1puQi9TdmJLS2FpMEVUYU9CRnNlVVEyVFlObFJOVm9Td3BxMGxQZjNQ?=
 =?utf-8?B?UmZkdy9kM1pyMWUrSkswTWtDakcwcmpkZVVkZEdGR0gwczczVTYvd2pWWW5Z?=
 =?utf-8?B?dzJjOXhvbzFXYmxLbU5peTVEenpuY1NvY1QyekcyQnQxMmtSR0JrNllhSERj?=
 =?utf-8?B?bWptVDN3NUlVak5TTktRT0pMSmZadXdsVDJ1cW8yVUJhVFpOVXR4dXpaa2VU?=
 =?utf-8?B?cm84VWhXSVh1NGtaZ1R2Rk5LZElHcWthV1VhbkZmb2xqc2xrVWdvNi85cjNv?=
 =?utf-8?B?QzMxa1BWNVVoeG93eTBVcGJvTGlLZ2drZHpQRUU4dE5Od05vODVEWGdGRW1o?=
 =?utf-8?B?ZE1vc2JEWEt1dGViMmdHL25CSUxacmJaT2xXRFc5WW5FbXlkK0JGRlpYdjM3?=
 =?utf-8?B?QlNNVEljdTVSM2RjQm55TXFMYVVYbTZxei9SRU0xQ1l1eHhBZ2lHUGxyWkxw?=
 =?utf-8?B?UnBpd1JjMFRPdXZnQUhDWXpCaVoraXNEUXN2cEpTNHNjR0JUQ1RnbisxN3hi?=
 =?utf-8?B?R0RPbkZGbFBLVDJwL3RwcThFZUNCMlQvQ3dWaktuOGloSlhYbGg0WHVwSFpO?=
 =?utf-8?B?Sk1Zd3Z2RUd5aWQxUUpjc3V1dWdyenJiLzhGbHl2UW9rOXNBcXk0eDVwUVda?=
 =?utf-8?B?WG1PRStDc2dsL0lSNGlNSW5QeGRMMmNiQ1FZTjRWbVlzU2puajl6SkJxNmVV?=
 =?utf-8?B?OTZGcWE4VWRwQ2hpLzhaSFUyY3M5K0Y4OExqd25UQTRFejNJTndlRlkrVjNa?=
 =?utf-8?B?Rlc0MEUzR05uUmFsd3BBeDVBaUxHQW05S28xSlEwd2RweC83aXI2MzZIYndy?=
 =?utf-8?B?clVlV0JRTTgvcisxaEI2bnZwU1BGYVNraGtYd3hTQzJ3enptdC96UXdJSmtx?=
 =?utf-8?B?Qzl3eEhmYjd5MG11dC9QK1p1MjlsT29VaElFSFkrNERwNHA4a2VBajBQekRu?=
 =?utf-8?B?eHV0SmhsUi8zSVJ3NXBqYTBiY08zT254VGtST25TeVNJZDRYMjVOV3J0RHUx?=
 =?utf-8?B?ZVJMVG1jTSs0Rk9ocVFzOHlaNStuUGsvRkNMaHR0ODdFNWoxc0hHSXBmTWZv?=
 =?utf-8?B?SURpZGd3RGdQb1BtNXYrRzA1WG1BUytJTDRxTnVidi8wNndReGRPc0xQdnNy?=
 =?utf-8?B?RWVEb1JzNDFCbGtqZ1R2c0pqU2x3RGFSdW5MYml1bXcvUVJTQ1NBMUVwYkhC?=
 =?utf-8?B?cDlsV1MvRmUrYy9xUW5DRnZXSmRublZHeTdlRFE4aDlSeEZla1dsQjVPSW1w?=
 =?utf-8?B?bEwyVWNyRjNxTnFyZTdXUGdidWdCdHdhQnhwVzdUeFliKzBWRW5MNlFtaHNW?=
 =?utf-8?B?Zi9qVjdQYzhlMEZRNDRoUU93MVdvTUFBTTVkUDF5RHJVVkZFWm92L1VnQ2FK?=
 =?utf-8?B?R0tqUEdZR0tDYVByTWtrODRyeHNJRGVYZWZBdFp1TzlORFZZZWhJNTFzbGRN?=
 =?utf-8?B?MWNpWVQwT1JYaEFRUXNSOHdpd0ZFMXlPU3d3Ri95b1VHK1Z5YmpZS0dqcmlW?=
 =?utf-8?B?THpXZmhyWG1IOWNsNk80SWNYYU03djI1KzgwU3prNEw3UE5KalJ5VVFTS2hy?=
 =?utf-8?B?MDVuTXFOUzE3dFg0NzdkSEtMRW52eVN1WXBnbFhINjRTRm5FUFMzaWVSY1N2?=
 =?utf-8?B?N1h6WUtONEM0YjhUam82VTdnUDMrU0RhTml1MUNJaHlpV2ZCcUJkRVpDVHRC?=
 =?utf-8?B?QnlMT1E1OGJZQUFJWmdSdDhMeE1FSHdTZ1ZhN1pmTWlUaU5OOVZhMHVNNEdV?=
 =?utf-8?B?UFRlSnJiUE5XVG9JbG9nVUZidkpRbzYrbHljYnZWVlErVHQ1NDJOZDJSbEpm?=
 =?utf-8?B?dVpWdlcrenhVdGIxOFVERjc2ZURaRTlrTE01MG9yM2xWdUR1TU5XdDBnUnRD?=
 =?utf-8?Q?f2Ylbh6uZQGSna7xx33aeHhSe?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2e784fb3-ff6f-4929-ce0e-08dcb88a62dd
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5176.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Aug 2024 15:46:08.6582
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: p/9HDDyZCvvIAVLVT0YUdZbXKuioCK7CcSq4zS7ca08xt63zc2wTWUQlZ8Sf1hML4YX/8D4zRXnJLiHBjdzhDA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR12MB9019
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240809_084621_583593_1C82340A 
X-CRM114-Status: GOOD (  15.11  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org

CgpPbiA4LzkvMjAyNCAxODo1MSwgSmFya2tvIE5pa3VsYSB3cm90ZToKPiBIaQo+IAo+IE9uIDgv
Ny8yNCA4OjIzIEFNLCBTaHlhbSBTdW5kYXIgUyBLIHdyb3RlOgo+PiBUaGUgSENfQ09OVFJPTF9Q
SU9fTU9ERSBiaXQgd2FzIGludHJvZHVjZWQgaW4gdGhlIEhDX0NPTlRST0wgcmVnaXN0ZXIKPj4g
c3RhcnRpbmcgZnJvbSB2ZXJzaW9uIDEuMS4gVGhlcmVmb3JlLCBjaGVja2luZyB0aGUKPj4gSENf
Q09OVFJPTF9QSU9fTU9ERSBiaXQKPj4gb24gaGFyZHdhcmUgdGhhdCBhZGhlcmVzIHRvIG9sZGVy
IHNwZWNpZmljYXRpb24gcmV2aXNpb25zIChpLmUuLAo+PiB2ZXJzaW9ucwo+PiBlYXJsaWVyIHRo
YW4gMS4xKSBpcyBpbmNvcnJlY3QuIFRvIGFkZHJlc3MgdGhpcywgYWRkIGFuIGFkZGl0aW9uYWwK
Pj4gY2hlY2sKPj4gdG8gcmVhZCB0aGUgSENJIHZlcnNpb24gYmVmb3JlIGF0dGVtcHRpbmcgdG8g
cmVhZCB0aGUKPj4gSENfQ09OVFJPTF9QSU9fTU9ERQo+PiBzdGF0dXMuCj4+Cj4+IFNpZ25lZC1v
ZmYtYnk6IFNoeWFtIFN1bmRhciBTIEsgPFNoeWFtLXN1bmRhci5TLWtAYW1kLmNvbT4KPj4gLS0t
Cj4+IMKgIGRyaXZlcnMvaTNjL21hc3Rlci9taXBpLWkzYy1oY2kvY29yZS5jIHwgNSArKystLQo+
PiDCoCAxIGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQo+Pgo+
PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9pM2MvbWFzdGVyL21pcGktaTNjLWhjaS9jb3JlLmMKPj4g
Yi9kcml2ZXJzL2kzYy9tYXN0ZXIvbWlwaS1pM2MtaGNpL2NvcmUuYwo+PiBpbmRleCAyNGRkNDYw
M2Q2YzYuLmExNmRhNzBiZGZlMSAxMDA2NDQKPj4gLS0tIGEvZHJpdmVycy9pM2MvbWFzdGVyL21p
cGktaTNjLWhjaS9jb3JlLmMKPj4gKysrIGIvZHJpdmVycy9pM2MvbWFzdGVyL21pcGktaTNjLWhj
aS9jb3JlLmMKPj4gQEAgLTMzLDYgKzMzLDcgQEAKPj4gwqAgI2RlZmluZSByZWdfY2xlYXIociwg
dinCoMKgwqDCoMKgwqDCoCByZWdfd3JpdGUociwgcmVnX3JlYWQocikgJiB+KHYpKQo+PiDCoCDC
oCAjZGVmaW5lIEhDSV9WRVJTSU9OwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAweDAwwqDCoMKgIC8q
IEhDSSBWZXJzaW9uIChpbiBCQ0QpICovCj4+ICsjZGVmaW5lIEhDSV9WRVJTSU9OX1YxwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoCAweDEwMMKgwqAgLyogTUlQSSBIQ0kgVmVyc2lvbgo+PiBudW1iZXIg
VjEuMCAqLwo+PiDCoCDCoCAjZGVmaW5lIEhDX0NPTlRST0zCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
IDB4MDQKPj4gwqAgI2RlZmluZSBIQ19DT05UUk9MX0JVU19FTkFCTEXCoMKgwqDCoMKgwqDCoCBC
SVQoMzEpCj4+IEBAIC03NTYsNyArNzU3LDcgQEAgc3RhdGljIGludCBpM2NfaGNpX2luaXQoc3Ry
dWN0IGkzY19oY2kgKmhjaSkKPj4gwqDCoMKgwqDCoCAvKiBUcnkgYWN0aXZhdGluZyBETUEgb3Bl
cmF0aW9ucyBmaXJzdCAqLwo+PiDCoMKgwqDCoMKgIGlmIChoY2ktPlJIU19yZWdzKSB7Cj4+IMKg
wqDCoMKgwqDCoMKgwqDCoCByZWdfY2xlYXIoSENfQ09OVFJPTCwgSENfQ09OVFJPTF9QSU9fTU9E
RSk7Cj4+IC3CoMKgwqDCoMKgwqDCoCBpZiAocmVnX3JlYWQoSENfQ09OVFJPTCkgJiBIQ19DT05U
Uk9MX1BJT19NT0RFKSB7Cj4+ICvCoMKgwqDCoMKgwqDCoCBpZiAocmVndmFsID4gSENJX1ZFUlNJ
T05fVjEgJiYgIShyZWdfcmVhZChIQ19DT05UUk9MKSAmCj4+IEhDX0NPTlRST0xfUElPX01PREUp
KSB7Cj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGRldl9lcnIoJmhjaS0+bWFzdGVyLmRl
diwgIlBJTyBtb2RlIGlzIHN0dWNrXG4iKTsKPj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAg
cmV0ID0gLUVJTzsKPj4gwqDCoMKgwqDCoMKgwqDCoMKgIH0gZWxzZSB7Cj4gCj4gSGVyZSdzIHR5
cG8gYW5kIGxvZ2ljIGlzIHJldmVyc2VkLgoKYWghIGdvb2QgY2F0Y2ghIHRoYW5rcywgd2lsbCBj
aGFuZ2UgdGhpcyBpbiB0aGUgbmV4dCB2ZXJzaW9uLgoKVGhhbmtzLApTaHlhbQoKLS0gCmxpbnV4
LWkzYyBtYWlsaW5nIGxpc3QKbGludXgtaTNjQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xp
c3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1pM2MK
