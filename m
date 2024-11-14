Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B33DD65C7C
	for <linux-i3c@archiver.kernel.org>; Thu, 14 Nov 2024 11:51:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:From:
	References:Cc:To:Subject:Date:Message-ID:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=BKmVD5RhfTdHHFgsnYl1fQ/9p9C1prN3FMwPK4kATMM=; b=d+MxB5ZkYBgO9PhnmLDhrgpW1g
	vJu6zSJH+nQbf86VQL6P9RWY42A3I1JrZR/qjz0KQvxem1GkYY4+RyJvD5cqRXFCVWgM8ApgmlcIn
	HhLmhApK1z9Ef+Ffa0L/8G+JHBIMr24EfUHSW5sWZUDfwQ79N4QjJuV+jbN8yFJuBzGiqLlXX6msp
	2XSyJXC1aFRF+n3olw3KxDRYXLIZWaH4aAZqN9chvRWvugIHJc/NukKxB8Uy08amEhqv5hIyiOwjp
	iahV61kgQKvoSBvuqRjznQpcl82TlkxHwYxDpODElMYN2dejr69tt4Q6FZnDCXASfh4TMs3RboG8n
	2gZ5IJmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tBYOC-00000009nM0-2J5Y;
	Thu, 14 Nov 2024 11:51:56 +0000
Received: from mail-mw2nam10on20605.outbound.protection.outlook.com ([2a01:111:f403:2412::605] helo=NAM10-MW2-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tBXlN-00000009fuX-1iD9
	for linux-i3c@lists.infradead.org;
	Thu, 14 Nov 2024 11:11:50 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yybm5ot8wGsleZ82bDZf06NGpf4XAz9QvnRjdE+qU3NbFlClgAgiqLJ0wu11YhIjalaiL/gx3AX1Ya7lmmMJer03z4Gwp9Qo9uXjP3wb3eF117LSp7WkOJvaNNt3f/DS+WuYMY25Qbv3bbrn+RUQyoWfefjlygJXeneEUPYDTuQXyrsUwwHwI+iPBXoadraP/zHmig8HIFhTAGSztIACkjuCLoByuLd6ihepR9hU5+4vo/+DK2Od7oVGLGLnThlhUas2v/2U828l5LCbhugyUt/Kp+ZNBTEavYqmqJvzqg5Tcm7Tnp4W3Xv4mWC8QJHly9xAhMbjYWhmxMB959Xxjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZM9rEMtKkfHR5uEoP/c6oKPcdqN5GJ0GqQBj2JzW4s4=;
 b=KE+8uGApYCJeHG4m3cHrh+sj93ulzW15ZowLzOwS5IGt5jNApG9G7Y3EOMYcwDK4lGsf6gigJUFrTPmqVJ/K2REjSrEpMzNij01k/6TOK1GzdL2V5GmIMcCGdajD9IhjfsctKDCHZERSNBd8ImFBS2v7hY/d0o4vQtMfwgxLAmq+/d/fAhPIMLphmoOPIjusaSuwTrffAEAucivirTxvqa/RV2AvJU401yHg7YaqoKZomEx9yJd76xk1sexhsZiYWbO2htDiTEUGRqlaYYzXpPBQ7XrVZkhFGm1ICWVBTZ+oZ0F26W6JHw6xavqlNYMQn/TVwEnFc5dnq0p4kwgE1w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZM9rEMtKkfHR5uEoP/c6oKPcdqN5GJ0GqQBj2JzW4s4=;
 b=chM0io1JZCK83tqREefjmSVolQX0WJqH3CMrV2LCCCQNT+aYBV4cBXmyy1eKk2g7o5Hhwj3y1CsqQNgcqWETzlcSmBfTtsm7ze3hSUicl/HWyyu0RNYWo09DO1hZhzdPQxQOaP2gUcAM02xQOgBg7MMu4lXMCeRe+6v4Jb/wmh4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BL1PR12MB5176.namprd12.prod.outlook.com (2603:10b6:208:311::19)
 by IA1PR12MB8077.namprd12.prod.outlook.com (2603:10b6:208:3f4::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.17; Thu, 14 Nov
 2024 11:11:44 +0000
Received: from BL1PR12MB5176.namprd12.prod.outlook.com
 ([fe80::ed5b:dd2f:995a:bcf4]) by BL1PR12MB5176.namprd12.prod.outlook.com
 ([fe80::ed5b:dd2f:995a:bcf4%5]) with mapi id 15.20.8158.017; Thu, 14 Nov 2024
 11:11:44 +0000
Message-ID: <5408729a-5915-4f23-8ce0-7d67bb6bfced@amd.com>
Date: Thu, 14 Nov 2024 16:41:37 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/2] Introduce initial support for the AMD I3C
 (non-HCI) to DW driver
Content-Language: en-US
To: Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Jarkko Nikula <jarkko.nikula@linux.intel.com>
Cc: Sanket.Goswami@amd.com, linux-i3c@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20241114110239.660551-1-Shyam-sundar.S-k@amd.com>
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
In-Reply-To: <20241114110239.660551-1-Shyam-sundar.S-k@amd.com>
X-ClientProxiedBy: PN3PR01CA0066.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:99::15) To BL1PR12MB5176.namprd12.prod.outlook.com
 (2603:10b6:208:311::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR12MB5176:EE_|IA1PR12MB8077:EE_
X-MS-Office365-Filtering-Correlation-Id: a0fb0038-1226-4db2-df95-08dd049d1f62
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?a2hsS2Foekt6UTVLZGpWdmtESzhITmJRZTFyQy9kMmdqVEp0M2NYQ1BLN1VR?=
 =?utf-8?B?SlZrN2xFbHJPNW55QkxMNTRva2NNRHFrY0RHd2ZYTkM5QnJ6aEpvL2UvTDYv?=
 =?utf-8?B?YmwzTkQ3eEN3czc1cXFoQkFzSUN2alU0ZlNpaGxKTTRtMkw0ZVlLR2RDM0FW?=
 =?utf-8?B?ekRxbGYzRmlVZytpSENCSUNwRmVid3VaNVIrOTIwUUdoWlV0eW1LVkw1Z29r?=
 =?utf-8?B?VVY3QnRLWlFIMFBzSGNzTVA5U2JJOFZwdWxucTBzRkNHMFZQdnlRT1BKd2lT?=
 =?utf-8?B?Ly9DTmJoWmlHL1ZoeEI3VS9XWlBSVW94S3JzdFB6TFpuQkg5Z1pndkpDSk5j?=
 =?utf-8?B?cmlPcUVaSzZHaUpKblN5R3FIdUZBM3ZrL0h4dUFBZU5Ddy90N0RLMnV2TTZH?=
 =?utf-8?B?ZHJQM2F5TzZlNG0wMjd6YnFnZTBWKzBGU3ZIRzdqMFFINXluazd3VFpEN2tt?=
 =?utf-8?B?QnhGWW1maG0ydjVGcmxjZHlTWVlUa3F0RW9YcmhIN3REMU54R3lBZ0lIemov?=
 =?utf-8?B?STc0VGZtaTFqQmhjQkhjcEJwNk9Wd1hxaG1nMHRReXpkVjM5b2M0bHVyc3RC?=
 =?utf-8?B?VTBNSzNpT29HdXZXMVR6MUlydjlNTWRVSVRYNXVxMWZrTks0Y2xLdWlBTGpi?=
 =?utf-8?B?dTFQSjRFMnRyNGZZQU9ObWE1SjlrSm9ha01Qc2Z3R1dMa2RJcEFNTkFuSUx0?=
 =?utf-8?B?dUkzNDkwZlZ3QTE3TlhJWnFYQm5LVFcwZEtxdFh5NGNEOXZVb2E0QVVKUWdO?=
 =?utf-8?B?QmQyTUdCZytnZFJaanNTZzBod0VhUk9Jd3lqN0lYc0NVb29tcktVeDhzRlJ6?=
 =?utf-8?B?eWMweU1rOWUrYVF6bUZvQW1vZlBHN3YxRnNwM3hONGpvYUJDR0VTS0N2b0pT?=
 =?utf-8?B?VDJvN0tERWxvL1hZa1QySFVMWk9jUVAzckJSY25TSG5zejZRYTVqSE5FNC8r?=
 =?utf-8?B?T0FpYW11VHVwaDNsVzlWWDEzTXUyMjhTUTZyVkQxNy96OVYxY05DdTM3OWVW?=
 =?utf-8?B?bGdEb0VBcUYrMEtOVCtpU0U4ZExDT3h3QXVUL1VsMlpyelpzL2ZwaXBpVFRx?=
 =?utf-8?B?eEJta2g3Vkhya3FVWFA3bnZOTm43VHN3eldrUEpBR1d2V1RhMEZ6cm0yOHd5?=
 =?utf-8?B?YU1VRVdMMk05eW1TbDljOUhTVVVkTWkvbnVUMkRESFFQQTlmTkt5OFUrN2pF?=
 =?utf-8?B?ZGN2TjBEWm9ldGtIVTUxVlNFdkx6eDk3bmNLdEg1Y2xZN1JUd1RVTndGUnN2?=
 =?utf-8?B?bHAva2pyTlBzblMybGZYb3ZNbnFaT0dvem9MdmZEWDViWnJWRStBTzZRU1Fo?=
 =?utf-8?B?aHFOeFd3c1BwQ1BnN2x0MG1talB0OERvaHdDTzJRQldsNFF1UkcxMUM5OWxp?=
 =?utf-8?B?ZHVOcnFkY1I2YlVHR1R5L3o0TmdKL21aVnZJMGdVbk5NaHp1NEp1R1IrSkY2?=
 =?utf-8?B?ZDQ5L0ZtWHRRSnE2L3JVM2NkSTRLeXFSNVNhQmZtSGUvU0xKdXdXNHczNWZr?=
 =?utf-8?B?YU0yUWRBT20xUXREN3FqS2ZET004Qll2TzJaVkJQTjNnZFJrVzNHUWNCZlc4?=
 =?utf-8?B?WGZKMjRLSTlMRHFhc1l3WHVZWE1BQ2p2OTRYYU81YldiMGxISyt1TG90OW5O?=
 =?utf-8?B?WGU1cUhPZi9haUd3aGpLYjkrRSswYXQ3cGJjZHBmKzVML3plbXlyNDlPZFo2?=
 =?utf-8?B?VWJqeitmb3BPVWo2a283S1pLUm1nNXNlaWFHTjVuQ1NyY1dYRk5OTm1jK2Nn?=
 =?utf-8?Q?NMI5onWmEcsLPYtBoo=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR12MB5176.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Y3dFRnROeUpvemVXSHJoVjhxNm0wLzdMN0dzRTF6Zk1uQ2gxWWNtVElmcVln?=
 =?utf-8?B?RnRPME1qY2FERFArMS9qM2piajlZOUwxRlRDRDBNSStxaHQxaVI0UmdkNThI?=
 =?utf-8?B?aFptTTByOTFJU2FxQS9qbnlabFhJSkFMUC83MmJ0bExDQWlZUGVlVkNqU1Bp?=
 =?utf-8?B?NmNIQXgxL1lNak4zRUZ2dnl4NzZDVzRaTERVTXJtYzJqc1NSNzdFV3J4REZh?=
 =?utf-8?B?b25IL1NHcXNPYWZjemdzZ0pGQ0Y5SHdBYXRHbnNqZ0MxV2x0Wllqc3QzeWhw?=
 =?utf-8?B?QWhENCsvQkV5QWhEVXdzUVZWMFhOMzRxeVo5aWN3M3ArMVhwK2JkMDNXNXgz?=
 =?utf-8?B?Q3RhMkpXaTl3aXRFUlo3TzJiTDhmcnlpSmFYQTB6S1VnZ25tTXpCN0U5U25w?=
 =?utf-8?B?cGdlM09HK3RBUzViWWtGN3ArRXBBQk1XUEVackY3dm5IKytiay9BeU9yM1E1?=
 =?utf-8?B?U2dZZElEL2xmNHhwM2tVU3dhMDRDbVozQnNZRFp0M1hheW16bUIyT0RUZkNr?=
 =?utf-8?B?WWQzV0FHdmE4U3p1VjNzcmoxY0k5SXVGKzZMcDhEN1JkWjJzalhoS1VWTWdB?=
 =?utf-8?B?M0pkcFNBT2pJTWhKMEhvREo1S3UyWTlxdXFFSFhaemdZQSs2cnRFQ0pLaFlO?=
 =?utf-8?B?SXpFMUJSR2REVDBxUUVmTlZhTCtoc0tCTVo1cnJSeGNkSkJPQlJ0Mko5cCtT?=
 =?utf-8?B?TUNEbm9ZWmxFS2lhUk1icDBUWXVKSFdaeVlUS3BUaDFydnhVZ3VHWEJsYWI3?=
 =?utf-8?B?UGxLM0JBVkRpVlZQeUlPWHM1Zm15UkVmVm9RRWxiVm91d0xZMWdYUlVqQldr?=
 =?utf-8?B?YlR4VzFDcHl5cTY4cElLVWh0MUMxaG94cmVmNlhMTjJJeGM4dGdDTmdpVGFL?=
 =?utf-8?B?enpBdHQxUU5vckdKUEg4ZmcxalYxdlZCWE9sTFp1QmNNeFFRbnhkR0NoRkZR?=
 =?utf-8?B?OXdKQVNkL2FJU3FPOGRnOTJXdVhhVkFRZGNzUnh6bXVJN1VvMnZqRXRoRzJ1?=
 =?utf-8?B?SW43Q3ZWRDRNKzBDYVF6bnZSbEZtKzRtVU1QTlN2RzBHWlRDenhUK1dIZWFv?=
 =?utf-8?B?Zit3SlVjMWdsRTIwREdLb2FDRHduUnY0ekIzbU92MXNxS3BwTlU5R3FiSEM3?=
 =?utf-8?B?V1Y2cVlXeFlUby9HWjZFMm1QK1h6SWFabU5jNmVlMnZkd0twTzZxNTVyVFR1?=
 =?utf-8?B?K09wQ3kwRFVjR2tpbWx2MlZZbzZkN3VjMlJGdytiTllrSjNMY3pQZ21IOFFk?=
 =?utf-8?B?Mkg1elNMT1ZxZWVBNiswUXgyVUs5cExFOW1ubjFsb2FKNDI4bUNzVTVYWnl4?=
 =?utf-8?B?S3JmOHdPNC9WRHB4TDFtcDhKaXRxbmllU0J2M2ZVelNXQjVPZFZGeXFYdnA5?=
 =?utf-8?B?V28zZzlyNk5rditqeUZwNmtrTys0MDF2b3NXdytSYzBqUDZoK1RodzJSZ3ZX?=
 =?utf-8?B?OXdhWFFUK2haVlk1VzhPcVdOL1M1Z3loU2hCRnMrZytBT3FlS2hlaFBVcEIy?=
 =?utf-8?B?d0UwNkVvY0tpT1Rtc3Q3bVlpT3dGWXlpS1BVMUZPZ1M5aW9QQ1p2Zk5NTzdp?=
 =?utf-8?B?aEkwa2JDZWFjZWFmMHRNQTF3SVN5WkRLOHlnTUUvZDBzaDJ2YVM1bGxMR3ZD?=
 =?utf-8?B?MmFPd0x0NmNjY0xsMllqVFBpUlNoNFlKWWdIKzcyNXFxUkphTE9tVThjTkdW?=
 =?utf-8?B?emVla1VyMm81MkpEZjl0NG80d3BtMmRJWTN4dkZsSUY5MHdFT24va2VONDVX?=
 =?utf-8?B?YzFKNHRxRnlGekdTYk1qdTd1MkpPOVNETm0yVGRSRW5KS2FBTlpsd1NUeTJJ?=
 =?utf-8?B?K3NjZnpUSWhPM0RxcUZ0NDM1T1hZUHVzQnJKL2RGTWhjcTQyb2d2ZHM3L2t2?=
 =?utf-8?B?by9idi9BbXorZ1ZrUXRMbXh2ZUh4alV0YzZnR0VtbUo5S2pYU1ZQQVdjNGp5?=
 =?utf-8?B?UkVUbGdRdWU3S0dOTFgzeWVsdmZMTjltaVlYV210TnlFR28zNlJmU3R3VGF0?=
 =?utf-8?B?YWJHY0EvRHN2VWw0VjRkZHMwTDRZcG8vZ2o3TS9tczZQOUlMVlJ6eWdMRENI?=
 =?utf-8?B?NHptbjhBaWsxU013c3NLZ0xlempQMWNUTlZHQjZxZ1ZyYzRBM3V0amRNenVE?=
 =?utf-8?Q?DaRr/hrs9w8FBiqlU8rkd0OSM?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a0fb0038-1226-4db2-df95-08dd049d1f62
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5176.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Nov 2024 11:11:44.2262
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /0AykuMAv7FIyVJMxrwrDcydX5jJURdaJig2hPXEz9GXxOFAdmVun4O5WDO63ez+M7xbTV9AlQtgrue86TfSUw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB8077
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241114_031149_497725_7923532B 
X-CRM114-Status: GOOD (  12.27  )
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

Apologies. Ignore the version prefix, it should be v4, instead of v2.

On 11/14/2024 16:32, Shyam Sundar S K wrote:
> In this series, support for following features has been added.
> - Add dw-i3c-master driver with ACPI bindings
> - Workaround for AMD hardware
> 
> v4:
> ----
>  - Split the series into two
>  - add Jarkko tags
> 
> v3:
> ----
>  - Address feedback from Jarkko
>  - Drop using SHARED_IRQ flags during interrupt registration
>  - Update commit message to mention about SETAASA
>  - Use bits [6:0] as the static address
> 
> v2:
> ----
>  - Address LKP reports issues
> 
> Shyam Sundar S K (2):
>   i3c: dw: Add support for AMDI0015 ACPI ID
>   i3c: dw: Add quirk to address OD/PP timing issue on AMD platform
> 
>  drivers/i3c/master/dw-i3c-master.c | 34 ++++++++++++++++++++++++++++++
>  drivers/i3c/master/dw-i3c-master.h |  1 +
>  2 files changed, 35 insertions(+)
> 

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
