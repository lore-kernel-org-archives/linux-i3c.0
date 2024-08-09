Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CCF57C52D7C
	for <linux-i3c@archiver.kernel.org>; Fri,  9 Aug 2024 15:33:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:From:
	References:Cc:To:Subject:Date:Message-ID:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=k/ZDCrxHAsvNNXveqxZEWlrzvfvQr0GWawdMVdeuP3s=; b=JUzx0i4DORJ0c7Rbd4UZUXR70n
	mNm1d5R+AakJ2CKysycAUAsRk3O0yCDQCl0w1WTpaq7PnGDBWI1cuwfTv6o7Rkn8bg4EYdZX18d9E
	2pgQOzD1Bp2nX+YlQvp8rlxd27W0/bANvpLySZOdjv6FsjgygVC1DJf9f5pb8mxzrLrOU9A9yF31Z
	xadW7pWe4beG2w3mGYPLvNK/6BfFpanjyto1tNTzuJkRdptx6Jj/c4Srl6v5Yh6qU3PLTolUPKMcU
	KPp2W8pMu/zMMHYg00mi0x/t4/yGuHl14fHrmz9pXgcYyEdd2SRRpIQ44m+ij44yCN5e89NFuSnuZ
	Jbn3mNjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1scRbx-0000000BjnK-0CbC;
	Fri, 09 Aug 2024 15:33:01 +0000
Received: from mail-bn8nam04on2060a.outbound.protection.outlook.com ([2a01:111:f403:2408::60a] helo=NAM04-BN8-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1scRbs-0000000Bjia-1mOG
	for linux-i3c@lists.infradead.org;
	Fri, 09 Aug 2024 15:32:59 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=chi8YEMq8aBTurf1oI1EhatOUdoAvi/j0lTt5VlNGQWbyJISqvgcwy2wQZv44h6HsecpzushPJd+Jzby62+NHy54oqh4xo4RX5DMuCkexVK7xQLaBL3oaHX9wLIS/rM02RNWaJj+KwpDCx6BIoht0sY1Z0uw70tvLDFLu8c+DkcBld9hT3ZVMsmMkQhBP12L9ZWCLxEVlExwcjVT6pDbR+cyMo8mapa9wO0huGz1fkmi/1iSf4iwXUdFiajd48kDr7UyW8knWc1lA8xaC3xbxEOKfTF3yOr9TRhiVuO6Nmf6/AnMmTvscvdRuzcg4n6nLr37912XwdH6pbaTMmx+0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=E4SVVrldHxV0C3h3vUfNSeEAp4hGuf1/B7pi3b8TPVA=;
 b=p9XOwaIDYJs9ghAS8bXKZLi59RSFUwx6nbyOwFecX0M5MmrY9ZXnpExAKtX5DaC/8IQN/Ajn7euf5ArwQWXM6Zn+qg0xZG/dNNH8euBTANqkhO/ybbVsAon1lsR7oot4Q0/LgIOztNnejk6foU6RbynBrz5vHWDJ6CnxN2dZ86AwK65WeEbWKSm2LQUn5oOfKI4jb54InLdqApFDee+FNkaSHDtMQ0ebZNy92P7hptW57fSD77xWnpfzKPgJDy02cNt2fxitnNiWExN6oBK0MhJgZ0CO+ZFiYIhnCxuzWggZvQ8SHgOG9CLwWaylGylrC2I2pL19DFR+vIYTCE5jjQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=E4SVVrldHxV0C3h3vUfNSeEAp4hGuf1/B7pi3b8TPVA=;
 b=x2JlbjXHx6xJ4KsvrLxsbJjZM/LcsCc5ChEwOgeFt0oMtK67pt9ItNkA3fM5PiU9Gx5HaNhJxF6u4+EaRNufSWuqnIg6MoclpixoTHxkmG3HUE1ArtFVOgGmQEz7fBfL6fotOpZctFctDo8xAA+tRSkMW7ZFcYtUvC28vexVPcA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BL1PR12MB5176.namprd12.prod.outlook.com (2603:10b6:208:311::19)
 by CH3PR12MB9100.namprd12.prod.outlook.com (2603:10b6:610:1a8::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.25; Fri, 9 Aug
 2024 15:32:46 +0000
Received: from BL1PR12MB5176.namprd12.prod.outlook.com
 ([fe80::ed5b:dd2f:995a:bcf4]) by BL1PR12MB5176.namprd12.prod.outlook.com
 ([fe80::ed5b:dd2f:995a:bcf4%4]) with mapi id 15.20.7849.015; Fri, 9 Aug 2024
 15:32:46 +0000
Message-ID: <c6ef0253-9f32-46d6-a658-295e39c926b2@amd.com>
Date: Fri, 9 Aug 2024 21:02:35 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RESEND v3 1/6] i3c: mipi-i3c-hci: Add MIPI0100 ACPI ID to
 the I3C Support List
Content-Language: en-US
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Jarkko Nikula <jarkko.nikula@linux.intel.com>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Guruvendra Punugupati <Guruvendra.Punugupati@amd.com>,
 Krishnamoorthi M <krishnamoorthi.m@amd.com>, linux-i3c@lists.infradead.org,
 linux-kernel@vger.kernel.org, "Rafael J. Wysocki" <rafael@kernel.org>
References: <20240807052359.290046-1-Shyam-sundar.S-k@amd.com>
 <20240807052359.290046-2-Shyam-sundar.S-k@amd.com>
 <e94efd42-bc3f-4003-8ad8-2da6500f0f13@linux.intel.com>
 <ZrYlNOjFQE9dHsVV@smile.fi.intel.com>
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
In-Reply-To: <ZrYlNOjFQE9dHsVV@smile.fi.intel.com>
X-ClientProxiedBy: PN2PR01CA0074.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:23::19) To BL1PR12MB5176.namprd12.prod.outlook.com
 (2603:10b6:208:311::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR12MB5176:EE_|CH3PR12MB9100:EE_
X-MS-Office365-Filtering-Correlation-Id: 331d2ff3-3fd0-4f2f-d706-08dcb8888486
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ZVJXdER0dEFZdzJFV1RxeTdadlQzMW9EQnRQcGN5L1RVRnkrcm9tb0l1dmxr?=
 =?utf-8?B?MHY5Y1gvU3hGOUNqS0x5VitNcmtFS0g1QnhCc0pjblRLbmdYamw4NGhyU0dK?=
 =?utf-8?B?MHJ3VW1MajhUaFBmQXJmeUtWdE1pRnNiOCtBcXMvVVp1RFlyQStPb2RiTGFU?=
 =?utf-8?B?K2ZTUVRjY2IwbFpQcDQycmd4ZnZodU8zVUx4SWU2enJFamZyK1dZU0d3WW84?=
 =?utf-8?B?dytKK1pxYW5GWUdkK0tPWWVRaFRhNzJUaHI1MGpzbTVnb0gza1Z0NWUvcmVT?=
 =?utf-8?B?RWRwMHhDaVVsYzRyZWNFSTRMU1VPUmlrNFJzb3MraU9nTDB6ZFZqSWpuWFhi?=
 =?utf-8?B?Vmx3YjVmb3d5Q2QvL0ZyQkdQWTJVVit0K1V1ZEEzRXhaWHZEYm9HbDNFSzdq?=
 =?utf-8?B?aVdNUG4zVndTQ2Y1bkVtaFlESXp5V1R5VmUvVCs5aEJaOVJlUGpERXRBNzZT?=
 =?utf-8?B?bnBzbVllV0s3Y0l1Uk90blVWSE9rWEViQW53T3pqSFVSQUc1bnV1UUgrQkl4?=
 =?utf-8?B?eEpBaXh3dHI1MzU5TkliOHljcTFmOWswM2pvMUJCZEhBbjM1YUdaZGtWVENF?=
 =?utf-8?B?QWV0ZnpqU0xaS3prUHlMUk9UNmtiRVJrZ05XbHk2RlJmUFI2MC9UYU9iRkJB?=
 =?utf-8?B?bzJOVnYrbG9HU2dpa2N2N2VLdGtlRUZnRTlQMEVNdTdvY0JPTXlGNTNyOE1w?=
 =?utf-8?B?QWlYNXUvWmhJNW0zYng4MHl0VVUxck1QMVBLUTVaMzJyTkNrRFJ0aWgwNG9j?=
 =?utf-8?B?dys0S3hVRVdvZnBVREdOVndnczY4dzBqTGlSclBGVjZBbktnV2ZmUVJEeC9T?=
 =?utf-8?B?azBncEtDSjFQcy9IYzQrZktlSUpscUk0V0pJTjB4Mm04M1hQOXZIYW9FUjZp?=
 =?utf-8?B?K3JQcjk2TzVDTm91YTVuYnBqbUR0dlJNanRSVzlGMjRYZjFBQ0hGMWdHdUk5?=
 =?utf-8?B?LzJmcHpreGZQUTZzYWJNUzd3cHhiY25OaHpVZHJWcXFFb3RBQVF2UktvdkpK?=
 =?utf-8?B?VkVSYStCN0ZYWjMyQzNYVG4rQnUzamhlOU5JRGNsWjZFVzJzSFBSWTJaYWVu?=
 =?utf-8?B?REVuWlltTEZkVFdqaVBKSUZoRyt5dWZQMkJ5Q3BVcm5SKzlMTEJ1QVdvaDZx?=
 =?utf-8?B?c0xSZ1dPcTZjdzEzV3daMytmSGtPbEp5TStzTVhkVjU0SmdtSkZCc0FXd1hm?=
 =?utf-8?B?a3ZOTWRKSk4xcUl4bVhBZ1R4aWdDaWxycVpGUUw1amI2SG5iNTJWaDlVZGY5?=
 =?utf-8?B?Ulh3azBHVmZ0NU41dFVFQjRBb0ZHMm1QL1Z5WDhOdWxGbW9pWkZSWmJhVmww?=
 =?utf-8?B?VjJaZzNyZ0ptNTF6MUZza25UdlFzZExhUDlqSWlJd2oxNWMyTHg4ZjVjQjBk?=
 =?utf-8?B?anZ2UkpvSnhtS3lJNUE2aDhtRTIxNmxVUFFkNVhtRFB2cDMwSFgyS2tsT2Jz?=
 =?utf-8?B?NCtmTUJlT2VBS2M2Vld0L2JnZ2d2OE8yQWVoU2tZbE51MTJmQi9wME96SFMr?=
 =?utf-8?B?SStlOTJnQ3BuR0dXUU5rSkhkQTVUWXhPTkxZVWtxbVFKdkl6WjYxZ09iWG1u?=
 =?utf-8?B?RE14R211ZjcxcTNQVWZsVFQyNzlNK2VKZGFhS1lWMzZ5K0ZJalcvVDM2RjhJ?=
 =?utf-8?B?QTloWWo4TUpmUzBBVSt0cGlXMEJ3WmNyU1NlRzBMaC9YREdrUjJqdnI1Qnhv?=
 =?utf-8?B?UmpqY0lIS1N6UDJ4L0hNTjJ5SDdhMnY4VllpMklsVUZZQVhqMDFSc2w5TVdr?=
 =?utf-8?Q?gWNLk5nfHwg0a3JWMY=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR12MB5176.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NFJmT1dGOXlqUWpVbnFuWTNubjdkbU96d1hyR3RSUXVlc3pZdW1nRUQzWWhR?=
 =?utf-8?B?Mkk0cEx6aENkNlZjOVRuQkkwMzhybnBRZzMwamEwQ3ZJd0IxZHdnUk5lcDdG?=
 =?utf-8?B?Q3lYOW9UY0dVZU5XaXNRdjlHM0gwREQ4dWxmbnlBdUFBUFA2dVROazlhZDFm?=
 =?utf-8?B?bG1mbTdVWXJ6aE82VExGREVyMnlsS25PbDNtSXhkWldYRzd4ekRwWSsyK1A2?=
 =?utf-8?B?cTVZdThLUzVWVForNVFTMENMYTI4SWdJL0xSSkhuazRXZGxXZ3F3c2I5N2ZU?=
 =?utf-8?B?QzlhWnhXakhCeG81Vzg0MDBBR1N6bE9CaTY5bDB5M2lsam55SVVFS0Q1Z1ph?=
 =?utf-8?B?ZnVxME1Qa0dVMWFSWlF4OTR0LzJVNWIvVlJxSmxNbFgrbUdadWQ2aGwrZXJa?=
 =?utf-8?B?QVdXKzYyRkM3VjNQeExuUXFkTGkwdDRvVXpMRmhVS2RQdGZ1L1V0QTY2bU16?=
 =?utf-8?B?K0VrMWtGMUM0Yk1xNTFWZTl6dWtTblpPdjlNcTlkb0xndlE4TE5MTmlCNDZr?=
 =?utf-8?B?RHhGRHI5MmtWRUF3OGwyOVRKb1Vvc0pzcWUxUXIyTVpydmxjNDdWTVF6K3JT?=
 =?utf-8?B?VVhmbEdGZVkxOGR1N3hqNUdkZm1weGo3aC9tbVJYbmhTTmlUc1NiTElDRjNU?=
 =?utf-8?B?SmwrM01BWVVYZlNqZXFYTTQxamo0VTZNN2lVRFlOS1BsNzQrbDVQRFpoZ3FJ?=
 =?utf-8?B?UjZPQ09yalV0L0lPRVZSRmZlOFdrNUtReWlEbW0yVnJaL29IOFFvdDhoLzNY?=
 =?utf-8?B?aTdTRzJReXNpWWRyMm1KZTF3cHUwRVBaUEJXWVd5U2Zta3ZNaHdzUWkvOUUv?=
 =?utf-8?B?WWZZSjhiVmxlYWt1SXRtNFpjaE15UjZkc0NYSDBFZW5rVWUvVTRIZlo4b2Mw?=
 =?utf-8?B?OVlzdGE1eTU4RE0xMTF2TmtZSkZ0ZXltWDBXUWQwbmc0RDRuVHBsTmR2blpx?=
 =?utf-8?B?dXNKd2xXaFQ1YlZ2QzlZaklzbEdsZFJ6NXpyWGdIUUtvRm9NMC9XUWdHNDUx?=
 =?utf-8?B?V0JVcHYvNzVrWXRlRWdNTzN1WVdib2Voek1ibkUxS0NwSi9vR1UwZjJ4RDI2?=
 =?utf-8?B?UFhlbjIraEo0NXZSUVV1TnFpbHRSa1lqZXBlZzFERmRlbWR6b2FKTTdBbjUy?=
 =?utf-8?B?L3B4anhxY2VQa3cyTlprbFlaaHZaUFdJdE9VVURmYkNtUnIyRmF6K0Q0bHBK?=
 =?utf-8?B?VTlST29jOU80WVBTYVJWVWR3UHhseUtOaVFTeFNQbzFhQVpaektnbDM5RW0z?=
 =?utf-8?B?MElqeVdsSG1LM1A2Q0NoK09xQVQxWHdLdkwvdnBZMHlLSXJXWlB1Z3M1YWgy?=
 =?utf-8?B?L1VFSUhMWjY5M2lBQUNLRkdPTDBKbzFTeEpGNFV1QWF0d0o0R25ISmlTZVdV?=
 =?utf-8?B?YVpqMERtQ2JwdWEwMmd0MVYraDNCMmxSWVpPemxONGl3TGN2RDNSNHMyWWha?=
 =?utf-8?B?OFB0M01pTE03UThJNzQ1UnozVUhhRnlYa0IvRFlhS0V3Snd3ZXFkd1BCNkd6?=
 =?utf-8?B?NmZTaTF5ckN1NUl3U3c5V1h2WkdIeC9jdnVObjQzWU96dTJSOFA0UndqaHkx?=
 =?utf-8?B?VldQTHFjWjQ4bzZNRVYzdXhWZEcxWmxqdVo3eXRQM3Q5ZVp5QllYSTloUHRx?=
 =?utf-8?B?NUgxWDU4VEVqUHdtclhOQjQxRUlmeTRJVVdmNFZDYVJQcFBySElNdHhqTERy?=
 =?utf-8?B?SXRpaTQyKzdPRFdWNURSS3l3a0cxOXVPTjJHRG9XQmdndFFXQ1paaXlOTit4?=
 =?utf-8?B?SEpISEVyVkRGODY2akxDek0wMlhjME5BOEVVSW5LOVhER25LVFByRU5hSnM0?=
 =?utf-8?B?OEJWN0FJVHV4cys5T3ArNGZiZ2x4elRVRWduejRqU3JGUktTaFA2dy9UaXhk?=
 =?utf-8?B?S3YvamZUTTlyanpYdm41VUY1ajByQXFITWtTQmVwNHNvYmVmUHNJcDVhTzBs?=
 =?utf-8?B?cGJkZUtGSlJub2YwbTBUbG9XQWpmWlpCK3JLeDRqejZWcTRQQXlGTXJlUXIv?=
 =?utf-8?B?ZWtBSlRDQ1Bvb1IrRCtRMWlCdFpUcjVOUTlPb0pPYXMyZnJTWVRjcStST3p2?=
 =?utf-8?B?bHJSbE9IMlhxbTJxWXJDQTlzZmFXL2lWRFBPdFFSZFl6REJXWUlNRkpzeXlY?=
 =?utf-8?Q?NrYDpQ79NrzZhZu7L29xfz0cY?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 331d2ff3-3fd0-4f2f-d706-08dcb8888486
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5176.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Aug 2024 15:32:46.2895
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yrq76VY9jzBmTV8lg8VoxVbBo76uNQSad897dQ+5MuqI9O00JcfS5pFSWm1/dKGJd9M+xAo6Xg3T8UdMjgum2g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB9100
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240809_083257_037843_1F546E2C 
X-CRM114-Status: GOOD (  21.48  )
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



On 8/9/2024 19:48, Andy Shevchenko wrote:
> On Fri, Aug 09, 2024 at 04:54:18PM +0300, Jarkko Nikula wrote:
>> Hi
>>
>> I Cc'ed Andy and Rafael because of ACPI ID allocation question that came to
>> my mind below which I'm not expert enough to answer.
>>
>> On 8/7/24 8:23 AM, Shyam Sundar S K wrote:
>>> The current driver code lacks the necessary plumbing for ACPI IDs,
>>> preventing the mipi-i3c-hci driver from being loaded on x86
>>> platforms that advertise I3C ACPI support.
>>>
>>> This update adds the MIPI0100 ACPI ID to the list of supported IDs.
> 
> When adding a new ACPI ID, always provide the following information:
> 
> 1) link (in some form) to the official confirmation / documentation for
> the allocated ID by the vendor (MIPI in this case) _OR_ (very exceptional!)
> why the bad ID had been allocated;

Member version:
https://members.mipi.org/wg/All-Members/document/previewpdf/89465

Public version: https://www.mipi.org/mipi-disco-for-i3c-download (this
requires a signup).

Since there is no direct link available for preview, I did not include
them in the commit-msg. But left a note that the MIPI ID is the one as
specified in the MIPI DisCo spec.

> 
> 2) are there devices in the wild (on the market) that use the being added ID(s)?
> 

Not in the wild. But the latest platform will have this support
included. So, these device IDs are crucial for the i3c-hci to be
supported on AMD platforms.


> 3) excerpt from the device (independently if it's public already, see above,
> or not) DSDT ACPI table.
> 
> With the given patch it looks to me that you most likely need a local, AMD
> specific ID as well.
> 
> So, in my ideal world the DSDT should be like
> 
> 	Device (I3CC)
> 	{
> 		Name (_HID, "...") // AMD specific _HID
> 		Name (_CID, "MIPI0100") // Compatible ID for generic I3C controller
> 		...
> 	}
> 
> Is this the case? Why not?

Please refer to the MIPI HCI I3C DisCo specification
(https://members.mipi.org/wg/All-Members/document/previewpdf/89465)
section 5.4. The ASL looks the same in case of AMD.

MSFT says that they want to use MIPI0100 as mentioned in the
specification.

What would you advise?

> 
> P.S. Make sure you Cc me on ACPI ID matters in the future.
> 

Sure, will do.

Thanks,
Shyam

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
