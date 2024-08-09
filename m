Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 538D2C3DA4A
	for <linux-i3c@archiver.kernel.org>; Fri,  9 Aug 2024 15:45:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:From:
	References:Cc:To:Subject:Date:Message-ID:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=3JbURPNjlWjRQeMKZ5TR/dkXwf0M25MkM1lyP/EgoFA=; b=jS+unMMaVXitVfx3tSTLPwK5Nj
	dd73Joik/9PjvsSovkWNVYpspjYTWXfxitmMnpAde8RsgcXPLpCq/ZkRrn/oGm8JwSqFMCSO97fA2
	uWqn7WiEYMYii3n3Uh+X3+8w0Ad6gIfGxq9h/v4ZDfuC4qm6Wa7YK+zWhLJA2v6NUStddriQq5XOX
	4QBRRQh3WmAjp4kahlDo8gGdlh1uKG0H3DrnyFd+0MGn5Ip9eAoDcrKUX1Tlofo/yLIBegyXN8BCb
	Q+5OcK3/3oRIrakNe/BR/mQUugSAdJYQ6PEmM4Mcy9I8RnLtgDho00vNIwHidpA9VbA0DHM7ddp5Q
	397w2LEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1scRnh-0000000BluC-1PEP;
	Fri, 09 Aug 2024 15:45:09 +0000
Received: from mail-bn8nam12on20609.outbound.protection.outlook.com ([2a01:111:f403:2418::609] helo=NAM12-BN8-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1scRnd-0000000BltL-3fgE
	for linux-i3c@lists.infradead.org;
	Fri, 09 Aug 2024 15:45:07 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZUE39AfFse9fKQwq9CZB0nenx+nY5BejkAFsrmrzvk1XtSLtTp4QeFM1R/ejs2xcPSYqODg8BPhl6H2H9hewW0G6yoBXnLCx54I6MJtyuW8YfFYu/IEZ+lW2HOVjAPkwULpecEKVabfTBPy6cC3L/tyQU+jLLmwuFGm7ICH2rpxuf3u1wHzxosOKU7/iW3Y85wpskOHcRum9KC5iyaFBUzuLqfscJFd0nkZE6MV98ryEzXv05YMhhC4phng4iY8zs+GMmVRP7LShjNLNy1rVswDp+ivQOZdfp9286OGzXg12mkUJuDurCvrxxywm6vCcC4ntBbcbmcrY8+8EdQ4xOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=18QH39VeXDRD5tEWBp6eQ+DwhUuEQWLGAMgDJLgKxng=;
 b=K/3KgSn8ieUM5Hzt8fny8B2LqPZovUjvcIYkt70jRrG9ItAB/p7+79g8geKmt4zcuzrEvVt+Ucjip+Te8k65Y1D5v/k547kahxMcDHYGdKbAYgCl+sTzGc9ZIBs9UR2eMXXCOr4b7efOTMek+0xFh7m1SV+fXfadISE8DpH7sY+iicEWeSeakTWh3+wXlp3vnsR6wtUzaHsKFc1eojZ7R6DkLHp1xooEVSwvGGuY2Lq3hYTdazzTgDaXoYdb9ohvAN84AVHkCk0SniojMZz8nlIWfqI3facQwA2vBVy5WBvRSgSSa+mVTJgjxPTWd17GRAHtUIspYpX54beZY5OdlA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=18QH39VeXDRD5tEWBp6eQ+DwhUuEQWLGAMgDJLgKxng=;
 b=Mk/qmO8Tu5zhkjhhEp4Gc6Pn7lZkGmqqR3fAjN7Qs8MKNa1oVqrgILNYQsUAEDExK5cRDT4wz86CEhciMa1vbub4ogCwQgfCspZTLKLsQx5AZOmVCgXARXH3GexROQw8QnwZAuXbx03Tej4eH6M3nJE9ZAPh4TWKcouUtrfMfE0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BL1PR12MB5176.namprd12.prod.outlook.com (2603:10b6:208:311::19)
 by MW6PR12MB9019.namprd12.prod.outlook.com (2603:10b6:303:23f::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7849.15; Fri, 9 Aug
 2024 15:44:58 +0000
Received: from BL1PR12MB5176.namprd12.prod.outlook.com
 ([fe80::ed5b:dd2f:995a:bcf4]) by BL1PR12MB5176.namprd12.prod.outlook.com
 ([fe80::ed5b:dd2f:995a:bcf4%4]) with mapi id 15.20.7849.015; Fri, 9 Aug 2024
 15:44:58 +0000
Message-ID: <94e789ab-2e64-4a6e-804f-b5e7b2a952cb@amd.com>
Date: Fri, 9 Aug 2024 21:14:48 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RESEND v3 3/6] i3c: mipi-i3c-hci: Add a quirk to set PIO
 mode
Content-Language: en-US
To: Jarkko Nikula <jarkko.nikula@linux.intel.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Guruvendra Punugupati <Guruvendra.Punugupati@amd.com>,
 Krishnamoorthi M <krishnamoorthi.m@amd.com>, linux-i3c@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20240807052359.290046-1-Shyam-sundar.S-k@amd.com>
 <20240807052359.290046-4-Shyam-sundar.S-k@amd.com>
 <2a9f6c23-9c7b-496b-9998-ea0afe526b46@linux.intel.com>
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
In-Reply-To: <2a9f6c23-9c7b-496b-9998-ea0afe526b46@linux.intel.com>
X-ClientProxiedBy: MA1P287CA0007.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a00:35::24) To BL1PR12MB5176.namprd12.prod.outlook.com
 (2603:10b6:208:311::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR12MB5176:EE_|MW6PR12MB9019:EE_
X-MS-Office365-Filtering-Correlation-Id: 20890f52-751d-4706-4330-08dcb88a390d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?c0h6b2w1a1ZpM2YvNTlzMkNNZjJWNWtObjd6S0lSQXcvRExoUUJxVFg5MUFC?=
 =?utf-8?B?MDRwb3J1YkhNTWlXTVBiQ0l3NGZJQ1NBbHp2Sk1KR1BISmtUZG44UFNmT2Y1?=
 =?utf-8?B?azd5eXVDQ2gzVnl3NU1xWENRSEFPalc2T1RXNzRvY1I1MnplbmFCeTVOVVl0?=
 =?utf-8?B?ZEp6RitkSEZkOHRVSkdjbTVaL0tYaE1adElRbTFlUTk4UVhYSGJWWFFoaGo1?=
 =?utf-8?B?ODJOTENlbHdGdlIvdE9aU0VtZlZocmtjRmJmMDNWb1dFWisxMmk2RHBjak9q?=
 =?utf-8?B?Kzg4UTM4TGc2NjJyLzZVenBlQi9RUmFHSkpJOWp1WmVucURheGZxeG1qblFI?=
 =?utf-8?B?THZ5alJIK2EzOVRIL05OMEpNb2RqQ2pVN2VzZDQ4YTlGcldWVWJjK2RpVFZy?=
 =?utf-8?B?M2ZmUVhUOGNOc1RDV0E4cDRxQjJqNFZ6dnRxNzdzaW9mS2lXUTJ4aWh6a0JD?=
 =?utf-8?B?bUtUc2pTbi8zT25ZQTB4MnppcFQ0N2hwVFFwdkxwT0ptdWVLK3dja3RKSGtS?=
 =?utf-8?B?aUlhdHVoT0pNNDMyN00wbm0yYWlPMUlNNERsOGF0ZVorNWZ1OElkMU04WWNq?=
 =?utf-8?B?UDc0NzZSbkI5YnlYTVlHNW5NMG9Tam1hMUN4MWlWNWNEQ005T2l4eG9RMitv?=
 =?utf-8?B?ZDI1K1kzTU5sRzhmRURZNDhkV1dORjZFU2ZxMkJ0ODVvamhOaitvMkR1RnFT?=
 =?utf-8?B?RktmTFlTWmNrVTM4N0R1QUZtdTlhL1FqL0FSUUQ1RXlxRmwzejN6bSt4RkJh?=
 =?utf-8?B?a2NsWXdtamtHRnhHOFBIQjMxelNEWVZPVmFRa2xSTnVaZ0R6cFJRQnlsZWJv?=
 =?utf-8?B?NEZMUzlpTnNpbUxSbDBCNlk1ZlZOKzdLWDUvVFd0cmRYZG1uQUdvUzUxeGQ3?=
 =?utf-8?B?R1JOenZIdldETW9OaUxNdTViVDBPMGdhVVFUdDBCcXFBNVN1djNkRHdPN3Nh?=
 =?utf-8?B?aGtvTjlsRHNPdTNDYmRjMFRaSmd3VjNqNU1KaHFDQUZaeThTWUpwY3pCSlhN?=
 =?utf-8?B?cXk2TWt4UkZub1kzbURyN0JoZUdIQ0pxSVNwU0pkU29MTlRuckdweTZXWlNt?=
 =?utf-8?B?YnZpemVzTXdmb0dSeEM4MldsNkJjTDRYU3VHTGFWcXpGWm5sWC9zcklOcGMw?=
 =?utf-8?B?V2V4VDN0WE1yVy9TM2dGeUxXWWQrVjBHRHJVbkNjN1Z5aFdVeU1LNlo2ZHU2?=
 =?utf-8?B?VmNaZGtnRkhvYzNsL05Fa3lySUxkbXg4WDdGaGxrQXFUTzcrRWp1RnpNR0Zn?=
 =?utf-8?B?SVVzWHpnMk9wa0ZEdlJZamUyaDhKRjdLTVA1cmlzMUtjK3B6VGFUWnkyYUpW?=
 =?utf-8?B?K0tBTWx5LytLMTlOc3V5bEFMcE9OTFBvM25qSG9zTGdxaUdxcWZqekx0QmlW?=
 =?utf-8?B?UkVXMmVjd2tqQnd3ejdUaGFHVG5sRVc1TjNWaWpta1dmSHk5WGFWVHdqbUxX?=
 =?utf-8?B?ZHRraXo3YlNLeERqWXFqQm42Q0RSaTlobjMza1FxaEQzTVJSb2tEdkhzeHRK?=
 =?utf-8?B?TlJtZVVrWVNNQXAzOTFyU0hRVmxWQ1FHQUdUcUl0aHhJcCsreWczeStoZXZ1?=
 =?utf-8?B?M2J4UVNmY25HZUNwOHVhalM1SENnYnVsbDVqaG1icURkQnVjckViVlhneFRP?=
 =?utf-8?B?SmNWd1VIYVZxczdYWHVkbSt2RW5lVGNoWjdGKzE1L3RNai8vVVBJYm9XcWVx?=
 =?utf-8?B?TEFvOGdTS3BKN0lEUE4zbTkzMUttZndDSWwxQlRxYWpvOE1tUjk5d2VTbDVB?=
 =?utf-8?B?LzdwRys1aDJ1NnpmT2Z6WjFjV2E1R09QL3lYZHViczVyeVYyYkJzcHU2dXVa?=
 =?utf-8?B?QXpGTklZU2ViSWV0RnNIZz09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR12MB5176.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?enNZb0VoMlhreVVqVWNuWTRKQWFZNm1yZTF6bUk0RG1ad1JRbTUxUmx2T2dF?=
 =?utf-8?B?eC8wUVd1QjBmYUZXLzNyNC9PeDNFeEczME95OWs3bW9jV2hQQmlrOEROV3NF?=
 =?utf-8?B?Qlorem52TFNsNSszLzFZcTlIeWgwQmtzU0pONElycmlobndmUUR5cStjTjFU?=
 =?utf-8?B?NWFIM2xiRE5OZytRckNiZGYrczBjYkV0aFVIWTFTNHdieC90TGh3RVV3OHRQ?=
 =?utf-8?B?TEdTQnF5UzB6ZzVHWHVRSXpWOGVUTXZraDlVNmJpOWhaQWZkbFhOL3VZU2ww?=
 =?utf-8?B?Nllrc1g4amtnMmcwbG9KWlRzRWVkckhkN1M2WWFCZS9ndlNJYVkwQXNtbG5p?=
 =?utf-8?B?RndpZzMxaHJJb0VpZGN2RHVFTDJBNTNvRW5ud3JHckFjQkl6KzZvdGU4dXB0?=
 =?utf-8?B?QlVrZmlRMTg4R0JUOG9rREczN01sQ2ladnNRNGVnck16bWlOam1WSlRBSGFs?=
 =?utf-8?B?bHZ5cENlV3JZeHpGZWxka1NUVTVsNHMvbVVwZ3hLZ2U1ZXFpQlRrZ3poSG5C?=
 =?utf-8?B?QXlMQ2pkNkVlNW05SXkzenhEME1VU05EaGMwVUptT2RJTDZDcU41enE0WjRM?=
 =?utf-8?B?aVVRT0xCK0ZmVkxyTGsyN2lqVFlxY0R6aHlFMFdORzkvanhDUEV4emczU1BV?=
 =?utf-8?B?S0NLTTA2Z011WWd1VjNYQVZGbVhManBVSHliVXJnMDhOWE4zZjVTNzRSWWV4?=
 =?utf-8?B?Y1NmNkFMVEJjbnl6b1A1MmQ2OTlxaDNWMXZ2dFllUnRDUTNTbzlkdHRmcXdV?=
 =?utf-8?B?Q29xQ1RHdk04M2NYVWpaa215L2FsVmU0MjhCRG11REhXQ0lxWlpSS1B4cjJM?=
 =?utf-8?B?V1lOOUZkMUhOektpeFVvSndVVmNseUU3REFDUE80dkM1VitPakRFako1WTky?=
 =?utf-8?B?cTE2VEdYczFVajVMWFlBQnZKSVVWb3YwcGFRRy9GVjZHdDNVS01YcXd3Mm0x?=
 =?utf-8?B?eDVGa1BGNXZyWEZwWVdCSjZSTlJFV0FxejR2dEhSZnBwOVZDd2lEbDBVUnZJ?=
 =?utf-8?B?V3BEYithcTdUZTc2SGg3MWx2bGl4RzZack8zSWhsOTR1TUZFMzVFTlBScGxS?=
 =?utf-8?B?ODRKY3MvaVhQTTJtd3NScHBpOGJWMnY4VlZoNTJScjZXV1lKZ2pSMURMV0tH?=
 =?utf-8?B?dTltbWpqVXlMUDNicnNjV0ppY05uMDBlbHJwRnRtYVhjU0hnMUQ5bmxkcUNy?=
 =?utf-8?B?WTBSaFF3bzVJSHpEMkRSSnYxMnZNb2NzR3hVYjNkYXNKSWh4VWluN0N6UFJh?=
 =?utf-8?B?S05wQm04SlY2clBkTDNmVUQyZzBUaDZabWxMMFd5WnErZndNcysrQ1VYRFg2?=
 =?utf-8?B?ajBUWHJwSTNjUGVWb1FHWnMrUzZTZGR2WkFwL1QrZ3lPQjlVRjRGbW9PQk9E?=
 =?utf-8?B?dzQyTTBGa0duNU5vQUtYbW1mNWhjajhDM1FTYmlmR3NsK3VLa0FSYWtDL0g1?=
 =?utf-8?B?NkwyK2ZZYjg3WjZmQlBOK0E1ZzBTUGhKYitoUXd0RFNhalVkVU5FLzBIcXk1?=
 =?utf-8?B?TUpjU0U1K2NrUnNKc2VkNmVxcjdOZzVGbElDSHFXVlE0UllyYkVLeWl3aDF3?=
 =?utf-8?B?QjQ3UXo1ZlQ1TUpyek5ubGcrVGI0NXVFWGVhRUJ3NnhucE5DcENHTWU2SzRl?=
 =?utf-8?B?cHhHSG90cHRVK2REWEhZcjczTkxFaEsycDJHa2FxRng5NGdjTnNtRWZUdkwz?=
 =?utf-8?B?UkZ0MWhCeldIeWpzbklOcmJNaVZlRElrSEpaT1loYnkxaW1Jek9ndVpTMWd4?=
 =?utf-8?B?TXY4eFZtN2FzYUIwOUpYNUoyUlpqVXBadFFnZVBCWXZpbWY1amJINm9WeDdt?=
 =?utf-8?B?a3RZWDVleE9mc3ZyV3A2YjRQaHUrWXg3ekNuZGJWd2JXcFk2SGlZWHFuRS9J?=
 =?utf-8?B?SFl6RG5zSXp0dldqSThwZWFjcUVHRzNzbzhYOGsySHBhbmlqVUZFVDFHWDRP?=
 =?utf-8?B?VWx0c0dVR3JGZmhRT1JsaURJdFJFNWxKNytMUDYyRlJTZStET0RrUGduNmZs?=
 =?utf-8?B?eEJNNTkzYlhHNi9JcVJwZmRHQjNhbzJlWHIydUVMei9RUHY2TkFiQ0VRaHg2?=
 =?utf-8?B?QkVNSFFtZFhteGtpU1NiL1JBUEI1c1JLelNsWFFoSk9Vak80UjNqRFJHa1NG?=
 =?utf-8?Q?SGeMgWj0nBtQKe/9yI2cxpfYx?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 20890f52-751d-4706-4330-08dcb88a390d
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5176.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Aug 2024 15:44:58.4801
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7gi2AuxGkttacIKCtYfT4p51Wzanww0sowjZd+bidMw5abkVbKBOnKf9C2gHeOxEW/sa5pOsCL0KFB6sCxfjAQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR12MB9019
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240809_084505_945706_D91E803C 
X-CRM114-Status: GOOD (  18.40  )
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

CgpPbiA4LzkvMjAyNCAxOToyNSwgSmFya2tvIE5pa3VsYSB3cm90ZToKPiBIaQo+IAo+IE9uIDgv
Ny8yNCA4OjIzIEFNLCBTaHlhbSBTdW5kYXIgUyBLIHdyb3RlOgo+PiBUaGUgQU1EIEhDSSBjb250
cm9sbGVyIGN1cnJlbnRseSBvbmx5IHN1cHBvcnRzIFBJTyBtb2RlIGJ1dCBleHBvc2VzIERNQQo+
PiByaW5ncyB0byB0aGUgT1MsIHdoaWNoIGxlYWRzIHRvIHRoZSBjb250cm9sbGVyIGJlaW5nIGNv
bmZpZ3VyZWQgaW4gRE1BCj4+IG1vZGUuIFRvIGFkZHJlc3MgdGhpcywgYWRkIGEgcXVpcmsgdG8g
YXZvaWQgY29uZmlndXJpbmcgdGhlCj4+IGNvbnRyb2xsZXIgaW4KPj4gRE1BIG1vZGUgYW5kIGRl
ZmF1bHQgdG8gUElPIG1vZGUuCj4+Cj4+IEFkZGl0aW9uYWxseSwgaW50cm9kdWNlIGEgZ2VuZXJp
YyBxdWlyayBpbmZyYXN0cnVjdHVyZSB0byB0aGUKPj4gbWlwaS1pM2MtaGNpCj4+IGRyaXZlciB0
byBmYWNpbGl0YXRlIHNlYW1sZXNzIGZ1dHVyZSBxdWlyayBhZGRpdGlvbnMuCj4+Cj4+IENvLWRl
dmVsb3BlZC1ieTogS3Jpc2huYW1vb3J0aGkgTSA8a3Jpc2huYW1vb3J0aGkubUBhbWQuY29tPgo+
PiBTaWduZWQtb2ZmLWJ5OiBLcmlzaG5hbW9vcnRoaSBNIDxrcmlzaG5hbW9vcnRoaS5tQGFtZC5j
b20+Cj4+IENvLWRldmVsb3BlZC1ieTogR3VydXZlbmRyYSBQdW51Z3VwYXRpIDxHdXJ1dmVuZHJh
LlB1bnVndXBhdGlAYW1kLmNvbT4KPj4gU2lnbmVkLW9mZi1ieTogR3VydXZlbmRyYSBQdW51Z3Vw
YXRpIDxHdXJ1dmVuZHJhLlB1bnVndXBhdGlAYW1kLmNvbT4KPj4gU2lnbmVkLW9mZi1ieTogU2h5
YW0gU3VuZGFyIFMgSyA8U2h5YW0tc3VuZGFyLlMta0BhbWQuY29tPgo+PiAtLS0KPiAKPiAuLi4K
PiAKPj4gK3ZvaWQgYW1kX2kzY19oY2lfcXVpcmtzX2luaXQoc3RydWN0IGkzY19oY2kgKmhjaSkK
Pj4gK3sKPj4gKyNpZiBkZWZpbmVkKENPTkZJR19YODYpCj4+ICvCoMKgwqAgaWYgKGJvb3RfY3B1
X2RhdGEueDg2X3ZlbmRvciA9PSBYODZfVkVORE9SX0FNRCkKPj4gK8KgwqDCoMKgwqDCoMKgIGhj
aS0+cXVpcmtzIHw9IEhDSV9RVUlSS19QSU9fTU9ERTsKPj4gKyNlbmRpZgo+PiArfQo+IAo+IEkg
d2FzIHRoaW5raW5nIHRoZXNlIHF1aXJrcyBjYW4gYmUgcGFzc2VkIGFzIGRyaXZlcl9kYXRhIG1v
cmUgY2xlYW5seQo+IGFuZCBiZSBzcGVjaWZpYyBvbmx5IHRvIGFmZmVjdGVkIEhXIGlmIEFNRCBI
VyB3b3VsZCBoYXZlIGFuIHVuaXF1ZQo+IEFDUEkgSUQgZm9yIGVhY2ggSFcgdmVyc2lvbi4KPiAK
PiBBYm92ZSBYODZfVkVORE9SX0FNRCBtaWdodCBiZSB0b28gZ2VuZXJpYyBpZiBhbmQgd2hlbiBx
dWlya3MgYXJlIGZpeGVkCj4gaW4gdGhlIGZ1dHVyZSBIVyA6LSkKPiAKPiBTbyBzb21ldGhpbmcg
bGlrZToKPiAKPiBzdGF0aWMgY29uc3Qgc3RydWN0IGFjcGlfZGV2aWNlX2lkIGkzY19oY2lfYWNw
aV9tYXRjaFtdID0gewo+IMKgwqDCoMKgeyJBTURJMTIzNCIsIEhDSV9RVUlSS19QSU9fTU9ERSB8
IEhDSV9RVUlSS19PRF9QUF9USU1JTkcgfAo+IEhDSV9RVUlSS19SRVNQX0JVRl9USExEfSwKPiDC
oMKgwqDCoHt9Cj4gfTsKPiAKPiBhbmQgc2V0IHRoZW0gaW4gdGhlIGkzY19oY2lfcHJvYmUoKSBh
czoKPiAKPiBoY2ktPnF1aXJrcyA9ICh1bnNpZ25lZCBsb25nKWRldmljZV9nZXRfbWF0Y2hfZGF0
YSgmcGRldi0+ZGV2KTsKCk5pY2UgaWRlYS4gQnV0IG9ubHkgcHJvYmxlbSBpcyB0aGF0IE1TRlQg
d2FudHMgdG8gaGF2ZSB0aGUgc2FtZSBBQ1BJCklEIHByZXNlbnQgaW4gdGhlIHNwZWNpZmljYXRp
b24uCgpJIGhhdmUgcmVwbGllZCB0byBBbmR5IG9uIHBhdGNoIDEvNi4gQ2FuIHlvdSBwbGVhc2Ug
cHV0IHlvdXIgcmVtYXJrcwp0aGVyZT8KClllYWgsIGFncmVlZCB0aGF0IGhhdmluZyBYODZfVkVO
RE9SX0FNRCBpcyB0b28gZ2VuZXJpYywgYnV0IGZlbHQgaXRzCmdvb2QgdG8gaGF2ZSBhZGRpdGlv
bmFsIGNoZWNrcyBvbmx5IGFmdGVyIHRoZSBIVyBpcyBmaXhlZCwgcmF0aGVyIHRoYW4KYmVpbmcg
c3BlY3VsYXRpdmUgbm93Li4gOi0pCgpXaGF0IHdvdWxkIHlvdSBhZHZpc2U/CgpUaGFua3MsClNo
eWFtCgotLSAKbGludXgtaTNjIG1haWxpbmcgbGlzdApsaW51eC1pM2NAbGlzdHMuaW5mcmFkZWFk
Lm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWkz
Ywo=
