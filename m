Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1499C44507
	for <linux-i3c@archiver.kernel.org>; Fri, 17 Jul 2026 05:12:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:Cc:To:Subject:
	From:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EaiSeNeEA0DoyoScH8bZ+OYBFmJ6AcsOSpCVu6SSQCo=; b=HzWar2FfxoPU+dXsWj1aWREZgX
	A+H9oRQTujIZ8gkLzjUVhD3Ze83UNrvAaCyp+KExNJomXrV+H/KU5x6aCqQoV7MV9kNp832f4aqiO
	hMmS0nYYVkvzIG/YHlJv/o1Ws2ANBl3oTIHAmCCYXr2gBiz6hyLwri38BgVmxwhqSagY/N1yCtioV
	0G/Qj69r+hjQ/1gH8h6sX70QmfDDovY4qj4WgQzloXf8t66jlTXsinX9eHy5yoDCb3+DIWYhjqn+5
	OmVH+ixmhRO0QK+JWbN2at4lfXu+CibuHDs/1zn3YitcAdndNvrdNJRon/le20SzuW0QOlpMMNyWX
	wnMhbJfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkas4-00000001AJk-2FAs;
	Fri, 17 Jul 2026 05:12:24 +0000
Received: from mail-centralusazlp170110009.outbound.protection.outlook.com ([2a01:111:f403:c111::9] helo=DM5PR21CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkarz-00000001AGP-3QYd
	for linux-i3c@lists.infradead.org;
	Fri, 17 Jul 2026 05:12:23 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kwsczSjIFpjA+pTzJqwS/LkP6+4jMAEN/MQvKTc2Uz9IqY2fxvTmH3IxvdzMYc5DpXAzJ/GTWPO2Bz8KYYOE51xMxfGzLzjHbwJAiqExBvROfEO8MVX5G6x0yHRhpA7w7gpXBCcrOF7Jf+9TiUJR3z3/1wZvvJ9WRH2Lg11xkUYDeJtLcWIULMzfVzZnBekQ3hCDQ8g3C0h4icqntjKw1+TOb6B7u72WAnQL0hE2kBbH5MYQZs0ysSqAi+KEfA0FEv2uMOeAc4bRafsYueLY045MA6ISfW5gbi7heCEwoAdpI6PlGQqrHr/fKXDXV4iVxh+wcQNFpV78z7w/W5k2lA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qpC6A3uAd/2NkHJxuI8DWWA+0/eGT9dqRzr3lKstCes=;
 b=T7sZ0XB9iKNWB2EXPV0dbXMYFNGRaS+IEzE/fwvV32I072369yqzlXQ/Nb8FA5bAmlVilbCjdEE5Bgpu2CEceOmipq8GJTf4mPdFOigMbfV3SVPRP28doRFGPzyyKFIbUoh6nt0frglMJJWqTe90giRkzTp9iTYPi4V+z6WVD5y7FWZBlxH9Bs4iFDyFjTp/+UaagdvQ73qWfQ3oy2ojNCjhrAQYrUkXy2dUAAQTTRAuL0b+zdxoA+mGeHDqXMrVe8QT4Pd51Mb+RGqujKyoMldutlQYnLsMdOwQqShfI0LItND6qgND6gseIhysXBRsVx7SdAJOD1K1UAUhMe8rUA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qpC6A3uAd/2NkHJxuI8DWWA+0/eGT9dqRzr3lKstCes=;
 b=p99yZL5SPyf+BeeYEH05iuhD/LyFSy6NWI4acU8QqLVgmrjHyKnWPpkV1xV3T1HUF+lmBEfSgllFKfqOBk/fL9OhI1LLoyju4V7C8vp2/is/q/2NqtejvtN974W4qjfBNvZNTFbfo7IV74l16XsKAuHmRBmrM5g3UuoU7CPEgpM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from LV5PR12MB9828.namprd12.prod.outlook.com (2603:10b6:408:304::19)
 by PH0PR12MB7077.namprd12.prod.outlook.com (2603:10b6:510:21d::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.11; Fri, 17 Jul
 2026 05:12:11 +0000
Received: from LV5PR12MB9828.namprd12.prod.outlook.com
 ([fe80::f132:7e75:fd38:8685]) by LV5PR12MB9828.namprd12.prod.outlook.com
 ([fe80::f132:7e75:fd38:8685%5]) with mapi id 15.21.0223.011; Fri, 17 Jul 2026
 05:12:11 +0000
Message-ID: <a00fff8a-b51a-4df9-bb2b-99a0dec74d17@amd.com>
Date: Fri, 17 Jul 2026 10:42:04 +0530
User-Agent: Mozilla Thunderbird
From: "Datta, Shubhrajyoti" <shubhraj@amd.com>
Subject: Re: [PATCH] i3c: master: dw-i3c-master: fix OD timing for first
 broadcast
To: "Datta, Shubhrajyoti" <shubhrajyoti.datta@amd.com>,
 "Guntupalli, Manikanta" <manikanta.guntupalli@amd.com>,
 "S-k, Shyam-sundar" <Shyam-sundar.S-k@amd.com>,
 "Goud, Srinivas" <srinivas.goud@amd.com>
Cc: "linux-i3c@lists.infradead.org" <linux-i3c@lists.infradead.org>,
 "Frank.Li@kernel.org" <Frank.Li@kernel.org>, Frank Li <Frank.li@oss.nxp.com>
References: <ebddb8b62eae92de0a7eeda93cb18213c677ae96.1781077653.git.tze.yee.ng@altera.com>
 <20260610083656.334CA1F00893@smtp.kernel.org>
 <airgnoB0Uh60mn8T@lizhi-Precision-Tower-5810>
 <ccf5721d-3193-4a2d-b1df-23e1c648eda3@altera.com>
 <48947d4c-32a7-4f60-b5bd-c0881e76831c@altera.com>
 <CY8PR12MB76110BF12DB1557B0DBEC0F78CED2@CY8PR12MB7611.namprd12.prod.outlook.com>
 <7e432dc6-fe48-44c7-8a04-f80eb7d56673@altera.com>
 <CY8PR12MB761142838F98DC828AF472248CF62@CY8PR12MB7611.namprd12.prod.outlook.com>
 <e36678e7-1c2f-4d2f-b0dd-c1ef2e533669@altera.com>
 <LV5PR12MB9828AC9C97DA5FA9C82993F781FE2@LV5PR12MB9828.namprd12.prod.outlook.com>
 <LV5PR12MB98286D643E990DDDA63B8CAC81FE2@LV5PR12MB9828.namprd12.prod.outlook.com>
Content-Language: en-US
In-Reply-To: <LV5PR12MB98286D643E990DDDA63B8CAC81FE2@LV5PR12MB9828.namprd12.prod.outlook.com>
X-ClientProxiedBy: PN3PR01CA0034.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:97::6) To LV5PR12MB9828.namprd12.prod.outlook.com
 (2603:10b6:408:304::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV5PR12MB9828:EE_|PH0PR12MB7077:EE_
X-MS-Office365-Filtering-Correlation-Id: 8d114133-0d1d-4604-8310-08dee3c1f4ee
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|23010399003|366016|376014|56012099006|11063799006|4143699003|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: +yYdaucbpM+DmqEc5XhEykdcdSDrTKx130hHPAg5FrsrfeQAYmGekpnzDbudUyD2qCJHs7+JTmykgI7061XZ8WXCe3rQ6Pa0gyHbcUuUu4B/oW23YeDFwqi/vIEfHlAyOC98QAZfogMwnolWOthBBvhVF0wmAaMuy8M76yCIXKrH8g5o3usCDxsuaGYVIzJyGed9Qs7cZ/Jly/GK+e3XRhG4VnP6NCjzarIEW0f6F3teO1yK2QmKw3bfKUxTAtgsOT6cfwc9ntZSgAY8qAEGnHRnfGKs+Mftz60s1NIESylbUKgwTKNoi11elf0KEKXr7/XPtd1jZ7VId4sFExZjClsFhPJlfuUdHXIFwe4ZtaO8zaHU9W8eWJHqy6aLzwPLZT7/12gnmNJ9shOMouldcHwTqTfRrG9zNJVM87lr2zzFi52XGYt6Je2mcwsoYd38tQuQMf2f7sHerXoVmh6MNUMTTFZoZP/ryNY0lon0ghDpQevsJLC54c6geP+laYP6fZU5mWpc0zWg0PvrLyFQJ6mBm8xCzjLAJtnY3kfyaZiHwB7TGgkl1eNA7ri9w+MAzngzMT+ahf9ujapyvbSFDpdqrvr3nHySVGMBf23DiOt9di4Y0r/PcgL9iIY91hP2rqJ9iJP+3VRrk3iaqndShFDsTTHp6hTt9WgJ3HGOg9U=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV5PR12MB9828.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(366016)(376014)(56012099006)(11063799006)(4143699003)(10067099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UGpxRkxobm80Wko1V0R0UVBGek1iOHFVMVllMERTS3JqZ0t0a2JteTZDa1hs?=
 =?utf-8?B?V3FFRlBxK1RQdk44amYyV2JKenkyTWhrZE93UWtqUWx3MXJqRUZnRlVXMEww?=
 =?utf-8?B?cXJqWWNYbHJEWFVObHo5S0VWQ2t2ZGV4c2VkRU1sUG90d28xdklCWlVpS0Zn?=
 =?utf-8?B?ZVBZZjlma1IzK2p1TUo1R0djMXBBamtTdHkrT3E0Wmp1Z2hOTWJ4ckVRblhC?=
 =?utf-8?B?S2ZYTFhlZzNTYzhCdEtLS20yWjhYelR6VCt0ZTZJYnBTVlRxaXlLVVR1SHho?=
 =?utf-8?B?Z2tuWCtCelVQaTdRckFZSzFmRStrWkZwaGZYUUREVlY1anFIZDhxVDNqSFFO?=
 =?utf-8?B?elZHbDFuYmUzU2dSc1IyNmgveFRiU0dSTnFwcnpFVytDdndkZ3pKWWhtdkRV?=
 =?utf-8?B?WWdSUGNvaWtXQkdrUFlOL3RwUWZ5YTdNVG5ISUNLTlJqR05TT2JIdVc4akxZ?=
 =?utf-8?B?dWNva1BMODQzYjJueGcxcnppSVM5NmxocGpKc1B1aUdNQ1FRak1QL3g2Mys0?=
 =?utf-8?B?dU44aitGenBoa1daQTVXYmFWYXFOV0FqZGVGamhLQ1o4cWFsNFhSbTIvaWhY?=
 =?utf-8?B?YzdiSDA4WXZCNGdHR0o4dXFrQlBMWVJmWGxML1RYQm1wbEhhQUlrdWk2Vmtz?=
 =?utf-8?B?WUpiclFGcVUzVzRUN042YkxyMnFiRTJXWE5lYllINEpSQ0VKTjhwTzlJbG5n?=
 =?utf-8?B?L0liOFdpbFFUYTBpSXU4MnQrelEvdytUaWUxQ3l5eGtCUHp6cTdQazc1K0Vo?=
 =?utf-8?B?VzNPMStSdG5RekJ5Ky9xTkNHWENyNWQrWVI1YVdIalVhdXk4cHBrNVhWMkxX?=
 =?utf-8?B?MW1IUHNtU0JMVzBIeWZ2N3hXQ2YwazQ4SzB3WXdJaGdtQnJ6TWRhNHg4RDMz?=
 =?utf-8?B?RitOQm5FWjJCTW1ocFNBOFlxQ1VnZHJ4b3pheXkrNXBlcnp5SzNEZ1FEeGdi?=
 =?utf-8?B?ejIvV3Z0NlQrVUxycUZmckxGY1pQMTd2am1vV1RUcGk1a2g2RGs1MkkzOTNV?=
 =?utf-8?B?ci9rZURFS1lCNVJzRnRaMGtKNEdrMDRwcVNNTDd5Y1JKcXp1YUdNTlM0RHZa?=
 =?utf-8?B?VFNGUGU0Y2FacWdiU2ozdHpJU2IrenV1VTZTank5MWpGandFT0R6dnlNVFpF?=
 =?utf-8?B?cXNvOVAwM3ZoVnpqS2tFRFVGTmRONjlxWTRPbnRvQzNDMEdIM0ZuK1pZdTdy?=
 =?utf-8?B?NDlXU0tlVXplK1Z0eHJJYkV5ZFB6SDU1Q2hiNjZ5OCs3cVh3bkdOZ1RxZEtT?=
 =?utf-8?B?ZUoyMnZwZ3cxNWxzQU50bDN5R0hZYnJITFNQdjVLQUtIa05taWNNTFFtTVNF?=
 =?utf-8?B?VHgvMFRKdFVEWStJZE1MbHdRVWFkMVd4V2R5Q0NmY3BsOEIzckU2SXZLenFK?=
 =?utf-8?B?WEdCZ2xOYW9tQTRoS1ViR2YzamthVmhDRlVOVnM3L2hpd2FjR3JlWVBEUWMv?=
 =?utf-8?B?VXZld3EvQ3JDeHZ1RTFnaTI3aUQ4c2NhZzBKWU1SZU9WSTBYWDRCTHBxdFBX?=
 =?utf-8?B?aS9iZ3loOTZsRTdQa3J2YjRVTFluNE8vR2h6TnhXcWFwRzRFYVh4bU9ITUpz?=
 =?utf-8?B?eE9sN3h2Ymx2bUJYS0VvZVlSTTFuaXliVjg2eFhSdmcyanVKdUNUQTY3SXBN?=
 =?utf-8?B?OWFoSTlsSk1FbzArMXFwOXU0UE1WTnk3SGxwWW1ZWGVobEFEMk1BeWlhTmI0?=
 =?utf-8?B?NlpiWWJFYVdHdEVZa0w3b21HazlQS21xbko3ZEZSMnlaT2tzbVlwblZPdlFx?=
 =?utf-8?B?dnZTdHhjbld5cXFVMXlsVWMwSmN5T0k2L2tzdHFTY1VqTVJHRGxQdjc1dFBF?=
 =?utf-8?B?aFI5OVhBU3pWTHFTTDNleDFIVlZEL0c2UTFTYlBKNmpyTCtQZ2xQZkd1WEUr?=
 =?utf-8?B?Y3JzOFN6cXNpaTBWenpXUTZxclluWWlVZERKZkJjYy9yd1RkUi9NYW5xK044?=
 =?utf-8?B?bHdYSDdZVE1zTFRwSEtIYWFFdnJWaXFtcHlzL05iMU15K1pzWFdHcG00ZUxO?=
 =?utf-8?B?TEUxbktUU21MVjJ2S1pXT2RsakxYUERkS1JIeHlwRUtjQ3IyWVZaaGNlL0s4?=
 =?utf-8?B?V0Q4TVdKeUxpYlQ5K1N4TmpJbEthWkphNWlRRDM3ZjV6Y1ZPbnh1c05WbTcw?=
 =?utf-8?B?VTdxNWNFMFRxRjN0bUtnV2ozVllqYUxkZlpxZEI5b2ZxbHJRSjlQWHRzZFVz?=
 =?utf-8?B?dW5QWjJ2a3VxbnR3dVdsWXprNFprSkZMUHhjNmJPN2d1ZFlDUVUwMDd4aWxB?=
 =?utf-8?B?bFZEaThvUitLblNNZzE2Ylh6WC91Vit4aHBsNVkvaGhyZ01zbS9FeDNQT2g1?=
 =?utf-8?B?UitibTRjRkpPTWVta1dzUWc1ZWlPV1BHVDd1YWFJV0tOanMwQkZIZz09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8d114133-0d1d-4604-8310-08dee3c1f4ee
X-MS-Exchange-CrossTenant-AuthSource: LV5PR12MB9828.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jul 2026 05:12:11.3399
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DFIvWikOPJGjC7yUNC30M/YOaRuFlV5Vs32N4KYvV+iYW1IzmZTAZYTYXNvhlp9Z0ogKSiiD7/fsz0MhvgL6Qw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB7077
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260716_221219_870791_7C673FEB 
X-CRM114-Status: GOOD (  18.31  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org



 > -----Original Message-----
 > From: NG, TZE YEE <tze.yee.ng@altera.com>
 > Sent: Friday, July 17, 2026 8:34 AM
 > To: Datta, Shubhrajyoti <shubhrajyoti.datta@amd.com>; Guntupalli, 
Manikanta
 > <manikanta.guntupalli@amd.com>; S-k, Shyam-sundar <Shyam-sundar.S-
 > k@amd.com>; Goud, Srinivas <srinivas.goud@amd.com>
 > Cc: linux-i3c@lists.infradead.org; Frank.Li@kernel.org; Frank Li
 > <Frank.li@oss.nxp.com>
 > Subject: Re: RE: RE: RE: [PATCH] i3c: master: dw-i3c-master: fix OD 
timing for
 > first broadcast
 >
 > Caution: This message originated from an External Source. Use proper 
caution
 > when opening attachments, clicking links, or responding.
 >
 >
 > On 9/7/2026 5:09 pm, Datta, Shubhrajyoti wrote:
 > > [You don't often get email from shubhrajyoti.datta@amd.com. Learn why
 > > this is important at https://aka.ms/LearnAboutSenderIdentification ]
 > >
 > > AMD General
 > >
 >
...

 > >>>
 > >>> Caution: This message originated from an External Source. Use proper
 > >>> caution when opening attachments, clicking links, or responding.
 > >>>
 > >>>
 > >>> On 1/7/2026 5:06 pm, Guntupalli, Manikanta wrote:
 > >>>> Public
 > >>>>
 > >>>> Hi,
 > >>>>
 > >>>> Adding the below contact:
 > >>>> +@Datta, Shubhrajyoti
 > >>>>
 > >>>> Thanks,
 > >>>> Manikanta
 > >>>>
 > >>>
 > >>> Hi Manikanta, Datta,
 > >>>
 > >>> Gentle follow-up on the AMD AMDI0015 quirk question below. It has
 > >>> been about a week since Datta was brought into the thread, and I
 > >>> have not received guidance yet on how ->set_speed() and
 > >>> send_ccc_cmd() should interact with AMD_I3C_OD_PP_TIMING.
 > >>
 > >> Will check this and get back.
 > > This quirk is added for the AMD legacy platform
 > > https://lore.kernel.org/all/20241114110239.660551-3-Shyam-sundar.S-k@a
 > > md.com/
 > >
 > > added shyam .
 >
 > Hi Manikanta, Datta, Shyam,
 >
 > Gentle follow-up. I still have not received confirmed guidance on how
 > ->set_speed() should interact with AMD_I3C_OD_PP_TIMING on AMDI0015.
 >
 > Rather than waiting further, I would like to continue the upstream 
process with
 > - od_cnt calculation fix (per Sashiko's review)
 > - using  PM_RUNTIME_ACQUIRE (per Frank's review)
 > - send an AMD-specific follow-up based on a best-effort assumption 
for the
 > AMD quirk platform.
 >
 > Could AMD help test that follow-up once posted?


I have access to only KSB boards I do not have access to the acpi legacy 
platforms. I will let someone who has access to it comment.

 >
 > If you prefer a different AMD behavior, please let me know; otherwise 
I will
 > proceed with that plan.
 >
 > Thanks,
 > Tze Yee


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
