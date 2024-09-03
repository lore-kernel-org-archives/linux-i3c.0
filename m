Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 211E9CD37AA
	for <linux-i3c@archiver.kernel.org>; Tue,  3 Sep 2024 19:42:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:From:
	References:Cc:To:Subject:Date:Message-ID:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=cNr9DDVoQ5moPEjYlBdVWKGIfaE9LUng7hHtw8ENGj0=; b=LUtDBHVVWmgEUMQBItwvgW4iVW
	xXkducFJTdgcEe0NHirf7cytNpCKXoQ/T+ljTwxZYEzFCkBmKPrieyE99V7AO/pwnpdimCz2+2Jf6
	qqfjEYmPSO47wPnLkL/ZSc0ZMiRJVUyZwwVCroa2/CEa9yATiXP4q092U0fbAac7dKtLn9kl+Egic
	VFYqcFSiIqPCk541DcYVnXNljcX9JQ3KoaDtP6R2kg3Wpwd2oTKGnsry7Q0jA93n/9Eb+5s7PvZTt
	6NzTBAM/AJO3TA1pxWU1R6twpLJqguUmf30JmBWm2ojcik0foAQ+U3SalVhkq2OSd2FrqsVdpopyb
	a3wbAN+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1slZPl-00000001dj4-1aNn;
	Tue, 03 Sep 2024 19:42:09 +0000
Received: from mail-dm6nam12on2062e.outbound.protection.outlook.com ([2a01:111:f403:2417::62e] helo=NAM12-DM6-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1slZPj-00000001dia-1Ggk
	for linux-i3c@lists.infradead.org;
	Tue, 03 Sep 2024 19:42:08 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OpGPY5BfFy36HTiHlU87Gf8GEdYdCy+RTCSWFqr3OWyo5ojI+LLGNNcoVB117WMO2MMNxU0fvTjG7NVVx6GJ6xBZ3j5aNfU/QZcvrbXAnlqSI1Pv13OuYEp3HCGfoV82O2GrkFXRh35K7q+QEO1WMhFGaDtOmobXBNJY9EU4wyXseUPK8QVe+0dYgv3kstn/7QwjULPED7Oz2z+5zqxT5IIS58N9kJrkS25GFEvHyjth/JD8T85UVViBXqd5hbjAHssmEvbUnWz4ByLdUgY7ORe48TzJ72dpT5XHZZuVvjka8OYlSH9BQNqfU4ks/9pEF1rdOiC5TMYu0SQp6/6iIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Y25dudIE5nWgNFTU9dLrojr3L4+0EMKlT/YxwtpB+KI=;
 b=c0HH6KqoZ/VEj4I8WX3eexGV66/GbS+wJyvEH5L2slQ7uWxqPhelRWDQtx2zlozYQiJhCIYOybhNVN91jAlt+hUbWHE/jI+2qwNPgob+DG42xEHdMVhxcflVrGaas6dVdHMkuWsXS5lJ11mDrqb7aua5aIg2M2WQ0fl+X0TBNBL57Wzu4cyzZMUTHz+dH7Fd3nr1UPBd05hrLNNLFd1B85M+wpdYzf0zysq2potX5M1CCUdTx15x3/ToVsKt0hmD2W2xid28P1rLSfRcmJM5PAuuMMcmn9z/jk4gevTxc0IRqG8t2ckqNQbqUVHNwSI9y/xZJbuyDpWUg/csNiQQtA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Y25dudIE5nWgNFTU9dLrojr3L4+0EMKlT/YxwtpB+KI=;
 b=IoCEOKkLMTz5ZgusFeBAzccNribO1b0zvuDAOTzb+bixdPFVC08mLbKenqVux80eIJbFn63C1j6JO61Fn5Q78oClRtgZ5K9c5gmOYBgKb70mpxXkFf9yA+h7UZR4dqJHnmW/MO5oJYc/HwfixCGB5hk7RUYssxHXaGUWOQz8HtM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BL1PR12MB5176.namprd12.prod.outlook.com (2603:10b6:208:311::19)
 by PH7PR12MB7235.namprd12.prod.outlook.com (2603:10b6:510:206::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.27; Tue, 3 Sep
 2024 19:42:00 +0000
Received: from BL1PR12MB5176.namprd12.prod.outlook.com
 ([fe80::ed5b:dd2f:995a:bcf4]) by BL1PR12MB5176.namprd12.prod.outlook.com
 ([fe80::ed5b:dd2f:995a:bcf4%6]) with mapi id 15.20.7918.024; Tue, 3 Sep 2024
 19:42:00 +0000
Message-ID: <1771b5f1-ee45-43b0-8d03-b6747a4dc1d8@amd.com>
Date: Wed, 4 Sep 2024 01:11:52 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 0/6] Introduce initial AMD I3C HCI driver support
Content-Language: en-US
To: Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Jarkko Nikula <jarkko.nikula@linux.intel.com>
Cc: Guruvendra Punugupati <Guruvendra.Punugupati@amd.com>,
 Krishnamoorthi M <krishnamoorthi.m@amd.com>, linux-i3c@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20240829091713.736217-1-Shyam-sundar.S-k@amd.com>
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
In-Reply-To: <20240829091713.736217-1-Shyam-sundar.S-k@amd.com>
X-ClientProxiedBy: PN2PR01CA0182.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:e8::6) To BL1PR12MB5176.namprd12.prod.outlook.com
 (2603:10b6:208:311::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR12MB5176:EE_|PH7PR12MB7235:EE_
X-MS-Office365-Filtering-Correlation-Id: 826374a1-f579-4f25-76ec-08dccc507a39
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?UUVNazc3WTB6TUJjNmJCdzljblZ4MlFyYnlMKzJmZWJiNVJhbjZsa0lHcXRF?=
 =?utf-8?B?STB6dG9MOGdOazc5VnAwazlWcVFVWWtCQnJXcWkyaUd4NWZLbUJmNXNkcFps?=
 =?utf-8?B?YlZTWkwrUzBxODdCUDh0WWZDS3ZjcWpBRE5lYytpSE5Sb0k4S1JyNTZ5Y3RO?=
 =?utf-8?B?S2I1cU83cTFHQ256L0NXYVZscS9LYXRXbXprbGZ0Y3lmNDV6TWg1L3dpQzFj?=
 =?utf-8?B?MGxUYitlS2Q5bzJaYmMxWFl5RUhSSFNTa2tWOStHdG5SanZXS3A4Z2RkdDZG?=
 =?utf-8?B?U1VTUVFJSWttOVNLbHpSVUVxa0hHdzVpSjUzaHRBUTB0a3c0QTl6TnJ4dGFQ?=
 =?utf-8?B?cWFZM2s5ZUdKK1h0bVNnczZlTDUrZU9ZOXhreHp6ZmI1OGQ5MlMxMkM5a0ow?=
 =?utf-8?B?K2RYRHBzeWtZYVpLTTNRMHFZSi9XRVIyeTM1NlMvdlJMK1ptbVUvZFQrRmNF?=
 =?utf-8?B?KzNWOTNmNVdFWFhtV296dWsxVHVKZjRmR09raFk2cmNXeDN5elZSdllUR0RG?=
 =?utf-8?B?cTU4WndPWUJBcEw2MHR1OW9VL1l3NTJMQ3FjaFBDYktPc1pWTlA5ZmE4VVo4?=
 =?utf-8?B?L2NpOFJSSzhMZEx6TUtTMVhDVDE3VW5FbXlseFA2TkQwWXJ3aUtTZVVLanpI?=
 =?utf-8?B?NklQNDZkMC9YVW5iRzdBYXQrcm5PTWdBSEQ3RlFEK1lNYm94MUhyS3dKUTI4?=
 =?utf-8?B?UVJ0TjRiRGJjdUE1a3orSU5DOC8yMTNnd0N6dTdOa2NoUUFrNUlGTWtnc1JF?=
 =?utf-8?B?ZWJTR3Q5czNpMWN2dm40WHBMU0ZNR2FVTHFBMXhqZ3FRQ2JaZ09PSy90QTBH?=
 =?utf-8?B?a21EQVljclpKb1d3SjhFUERqdHJDZUs0b2ZxUy9HTDZ3RXUwaGkrMCtHWlJI?=
 =?utf-8?B?UzIxSXFGZDhjeUlpTEh5alhzVi9FL1RrUUNjM2RtcVo1NG5lQmtYRW41RmNB?=
 =?utf-8?B?Sy9CNU0xWjd1MFlkdGszOFhVTldJMTBmWTdhSDZ1K1FPM0VMUW1vR1RPZ2Ez?=
 =?utf-8?B?a29KRGRod20yUWZ6NGluV1JnTTFIckxJOVJhN01hN2kydDFSdkJUS2h4eXo2?=
 =?utf-8?B?bURSRFJCVXArWll5ckN5RnNFOVNZWkE1d1R3VDVtdFY0d25ycDdCT2d3YU5a?=
 =?utf-8?B?eGNUamlGNTdVaWh6WFZ0b2FJUUhBTnNhU2FMeGdvNDJoNlhOVUFOMUlwQmM5?=
 =?utf-8?B?a3JxZnZvZVM4V1VhdzJ6aU0yb1J5ZW0xSG1KWjlLVzZGenpNWTdXcUpCQkNW?=
 =?utf-8?B?a21YWGlFZ0tsY2xacFFCckF6Q0N4RWgzWEI3bDBmRFhSSTlEK1V2aDVjbkV5?=
 =?utf-8?B?dWR1UlB2b0ZZaFJMM0JyUlErWnExUzZPUlpFMFF4cXhJVnBPL1BabU1lMlRH?=
 =?utf-8?B?WFkzVG5vRHI0MXpvWEh5NDh3UnFhb2ZpbDRjSGdoMDA3OTBLdi94RWFkcFF6?=
 =?utf-8?B?RmlFbzBsd2xWQXdVOE5wWldQZWRMeEw4dXhMSzVvYXZBNFpPMTM1S21QRmJn?=
 =?utf-8?B?Q0diUEpyTUVHM2pJeVp3SzhZa2QrWGVKcnEvS3BOZDBRSFNSRys0a1NkbzE4?=
 =?utf-8?B?TlplZ3R5ZGtoblFhM1VabW44NUJBdjVFZmh2NjVCMi85V1FlOHhsN1JlWjZU?=
 =?utf-8?B?VDJlMUdQdGR0cVJxQ3pCTTVobm1rSEQzTWtuMzhNZlFPRUNma3ovWVN0eTU1?=
 =?utf-8?B?dWJtSDVJL1g4VlJtRXhqaDEveWVmeE9ZZlJjT1BWd09hWGhTRWNpSkZ1L0R4?=
 =?utf-8?B?WWhJT244WmNXdkFtQ1NmSDhvNExabDAzWG5qak55UVhkWit5SUF2bXZjbEU3?=
 =?utf-8?B?ODdkYWNXVWkvRDJZOE56dz09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR12MB5176.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eW5keXJSNkxCR0hqNk4yNm1yYzZLSTVJZGZZZ0tzSTdFN1JWRWJkd0lMVEVp?=
 =?utf-8?B?SWxWd3YyM2x4MlQyMUVyZnIxTFp4elZwZXpkSFN5MjJUZnJyVDNaWnNvbmVB?=
 =?utf-8?B?b1dhelNrOVVianZLQWFzc0twVWlheU9WQ1BSa3lhMW94aUxHdlljUjlOak9a?=
 =?utf-8?B?RytYN0FobFh0dnArMGNWUHNiQXd5bC9idmtCb3ZnRmt2YXdKNHhxc1Z4RlB2?=
 =?utf-8?B?QmJnYlRtNXZaOWhVbkpJb1F4TEpCMDZ1OThtb3NvZW1NdkUwSkN6NWcxb0h1?=
 =?utf-8?B?d3pCT1BXNlNrMzdkZTJjdEx2QUQ5T0FQOHNmMTBpb0ZGZmRraXZaNnRKVE9S?=
 =?utf-8?B?MERqMTVwSWVTdGRlcEMwNFJZSnQ2NGJwZkRFTjNGYm02TVZjSUFYQ25ZeDYy?=
 =?utf-8?B?b2tGNW51OWNRUWZGRllnYzRmdk80WjltaEZHSXlqZEtSU3ZRdUNOM2M2alhL?=
 =?utf-8?B?VzgvRi9UWFNiQXlsdzdteFBEUU03RzUrcmc4VjdIakUwS2p4ZkUvei9vcGE2?=
 =?utf-8?B?TFhBTWcyVjE3N2N5bmtBb0ZnYkxldzdzK1pnNGNkMjEyN2Z4Z1NWcE1CSWdr?=
 =?utf-8?B?ci9YazhEbEE2dTFXK0J6S3FpMHNaVHpxTGFBRDJ0aTgxNXBHMGsvb1NXNkpq?=
 =?utf-8?B?R0NwditicEc0WUQ1WWRYV2lvNFF0NWNQdkNaNHRiRHQvcDR5a1dqeE1yaFZ2?=
 =?utf-8?B?R1FzdjN4V1NiVk5GUVE1RXZjZnVkSlE5a1J1aWhnUnpmdHdLdHpVUUlzNzdq?=
 =?utf-8?B?MjV6K21MZ0RSUUV2WXlaVE9uUzRzU2RhVXZuR3Q0SUcvdStFTGVia0FkMm1h?=
 =?utf-8?B?cHk1T1c0a1FGQUpYeFFUb3NUcG5DbUFWL29kbWpTNTJzWGlzbVhCT25PTGpJ?=
 =?utf-8?B?cWhhd0N4ZUFjalVUZnRMWjJpTkNaSWdYQ1NuSDFKR3Iwa3lITTgvVTFKWThN?=
 =?utf-8?B?eHpTdmdpZFh2d2gvQ2xHZ29lU1VzM1lsTiszZEMwNGRzREV5Y0htTlNNYTcy?=
 =?utf-8?B?SmE1Z0s0OFdkVE95WDlYd2FRSmlqN09FcnErMFRYeEIweFVUcGN0ZDFvRUtt?=
 =?utf-8?B?TnZ0M1ZlNGdRb3JZZHJ0NFczN0ZYRkl4d3RLKytEOHoralBoWFFjR1VUblhr?=
 =?utf-8?B?Y1hGYkZlRzhGVlRzTjMwU0c3aFJjalNSZWRVVkhSVzRZOFBlYXhpT1ZWenRo?=
 =?utf-8?B?cVBCeTcxWXVjVmFxTitrN0ZXZjJVZUMrakp3NDYrRHR5OVQ0Z3VnNW5Rd09o?=
 =?utf-8?B?cXhKYXZ1YldGc3l1NEJqVGc2b3E2MkJrK29LMEVXV2JWK2JCM0RGcXNVanBR?=
 =?utf-8?B?REUvS0xhZ01BNkNucTk2eWNTME02bml3MEozRFlSZ3N6Y0IwQlhWVGJSVmRa?=
 =?utf-8?B?YzBPRnZiZVlzQVJVOUpsNWZBQWVLSTlEK1IzckdHbExxczRYU2ZLSi8vMUdW?=
 =?utf-8?B?aVNMbnBJUnVIamRkVlBaMkFJQVhsZ09KK09nVk1lRC9uL1UxdmJBS2phRmgv?=
 =?utf-8?B?S211UTEza0xoeDZLQzFMVHVOWVI2QkloNldNY3FPd1Q5SW5nVHJveC9pTGk2?=
 =?utf-8?B?blVIRGRwcGhLWCtDaEtGcFVuVXZydy94SXFvblAwckhBRHQwSVpjR2FjL2Nl?=
 =?utf-8?B?dTVGL29ULzNsYkQzSTZWK0lMVjZscGZ3VGZWTkZ6aUlXWk1zVVB2QlFydnJM?=
 =?utf-8?B?YkUzTVJxcDJQTHdEUVhlbmkyTW9ZR244Smd0MHk3YnVBWVZmaUllMGp1VXFE?=
 =?utf-8?B?aEVCbnhqb1Q0aklac2N3ZmUvMFlnYXJtNGRRZE9UVWdXYng1bGV2bjl4QVd3?=
 =?utf-8?B?TFdRSTU2SzNNOWFVVVlTQ0VjOWl6SjErMFpEeGp4VHViZnczWEw5N0gxbXF5?=
 =?utf-8?B?aGVnZW9Ga3JSTm1Sd0xDWmh5ckdWTTU5VTBZRHY2SFNIK2ZmVjJvNmxxYUdH?=
 =?utf-8?B?Yzd3ZlZQTENFMWwvK3JDdm9vMHRQUUJOL3VtV2RWUFVzR3VFdVcrVURLQmdt?=
 =?utf-8?B?Z3RVNm1wNE1wcGV0MXliZEhhVXBQY3FveUQvR2xoWUpRYVBvUGVjK3FTWFRo?=
 =?utf-8?B?Mld3S3p6eEZYMm9IOHJwR0ZQeFlldnJ1RFhCZHJDQk5xY25SaS8xajBRSDVZ?=
 =?utf-8?Q?fXmJZAulo/8D7nCE9DUkJuhzW?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 826374a1-f579-4f25-76ec-08dccc507a39
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5176.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Sep 2024 19:42:00.2945
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qrAlnqsG0zSQkR6ZBMgS0hO8APr/mp7Tk470XlAlk8ioI43shExas73BfmIe8v1frqrAkdmdwXWNQKHvbag5GQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7235
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240903_124207_434008_73499B41 
X-CRM114-Status: GOOD (  12.81  )
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

Hi Alexandre, Jarkko,

On 8/29/2024 14:47, Shyam Sundar S K wrote:
> The AMD SoC includes an I3C IP block as part of the Fusion Controller Hub
> (FCH). This series introduces the initial driver support to enable the I3C
> IP block on AMD's latest processors.
> 
> Currently, the code is closely tied to dt-bindings. This initial set aims
> to decouple some of these bindings by adding the MIPI ID, allowing the
> current driver to support ACPI-enabled x86 systems.
> 
> It was discovered that the AMD I3C controller has several hardware issues,
> including:
> - Non-functional DMA mode (defaulting to PIO mode)
> - Issues with Open-Drain (OD) and Push-Pull (PP) timing parameters
> - Command response buffer threshold values
> 
> All of these issues have been addressed in this series.
> 
> v5->v6:
> -------
>  - Add Reviewed-by tag
>  - Update to variable name from "pio_mode_support" to "mode_selector"


Can this series be applied as 6.12 material? (as it has the all the
tags now)

Thanks,
Shyam

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
