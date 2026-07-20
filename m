Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A67D7C44524
	for <linux-i3c@archiver.kernel.org>; Mon, 20 Jul 2026 07:42:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iwOOCOEX+XPP999NYnbV1at5RRVa0COp68gxL0FYkBE=; b=BlrEDt3lSEpV3AD4kOdPRgamyu
	0zgz6xOelfnTJCi7hfz3AuQA70p+yleL+4dcNrspi/DcWL1xvpPePgptVeCYwwkPlGnJInAVv/bO2
	GTk7M06hdMrM8Xk/9RyS+CQ3HnipXTyjBB0Wj+rXjX0cEkQTBHm3oiKnBF+kLRdfbvcvjyTpyGFxk
	JuuAJbfAcsKQil9hWO7Dm7zXoCYXRfjDj3i9sC+q/fgleEodCwiRv58566RbKV44RFGImHYyhxUME
	Jp8bcp2ZLzfc0G2N1Mm+XtdM4TORYeu0geIouIEdFaFG+4el6qfOUddFNP9UFMCK921dEnh5tq/R9
	+g4h67ew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlidX-000000067mT-1QdB;
	Mon, 20 Jul 2026 07:42:03 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlidW-000000067ly-0tZs
	for linux-i3c@bombadil.infradead.org;
	Mon, 20 Jul 2026 07:42:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=MIME-Version:Content-Transfer-Encoding
	:Content-Type:In-Reply-To:From:References:Cc:To:Subject:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=/4IyTuQ6utoZnHFaRXcWgTdGqaNWZ5Rh7yIldRw/XW8=; b=AZtqRbzGh354itvRxu2otszAXF
	OTP6X1EQs9+f94S0ILszzbF/n17UP2i5FS7EMe4DRWdNYgg9VbvzZ16QjD8q/3h7iXGxPm51CAwZQ
	xLSEejYdVlOGEFCwv8QCjxuHQ2QfsZUv9KU80H79t0IXWA0y2fWJ4xFPdAV5YJC+KHL6qMx2RcgJr
	rixTnHTuRVru1Be29zuplLYCeDpiBkSBtsLkUE8qSu1yAk4+u5nnpWe0B+HEwa0uh27HtXnjA84RY
	IrR4+Re9nhn0r5gedpWuWe9BkBOyqIsp/bnrXLB0lSV0mv7Had6Wfv6yOKYu9weUjJde1E+Kb3DuZ
	diDA3eIw==;
Received: from mail-westusazlp170120002.outbound.protection.outlook.com ([2a01:111:f403:c001::2] helo=SJ2PR03CU001.outbound.protection.outlook.com)
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wlidN-0000000GLwy-0RuO
	for linux-i3c@lists.infradead.org;
	Mon, 20 Jul 2026 07:41:56 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DMI/94ql0wI5ziW7oyfzI4WClKhUvNllblEHUj+FxvAD9ER0M0r+g3nEXGcBVDJJZN3jChqn6G5qcFZQ61Q8oM2/YFqC2YkWdV42KjkJYJUM+nwBJYWWmDTe6qs6C9Tm7ZFYKTt7N8CO+/mOk90L90L2OVUWekOPkb3tM73aPmj335s/rmRbS+FYPxH0LGqkbORSgDsfYp0XenktUpbdVZZxHAmLHEIxvAMuDzYwakyuEeP6BDsrbkED9ZW6ilkVz+D7LVEtsMhVDSvRRksuVf9bby9QIJdogR4QOnrKSHAbwsg3NhL5qwBPRPDv4PMyZTCzSTZG2rpAuMBeex4R/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/4IyTuQ6utoZnHFaRXcWgTdGqaNWZ5Rh7yIldRw/XW8=;
 b=MHXA5DQOp0+NFL/m3mnnan+/HEE0BXO1MKKw7xzKEFhaZJg9VETAtY9jxM4KKQSE3squZ7IGct/qtraCzX8/e3jAbKBYXNdmnU2R6mFa7TFb+kLV+vuOpRfY3nA99QzsZwaZuBfKduS6fYN+V4gVIk/fvR5e3+7fYmuOx7LvSxEGvJlMsqVeObd27Unaxy9l5+e0d7bXImS+fGU9qQ5bExOWGBX60NihAqwLrWPFWBLN/4qc8ZM77A0ZHPgwaBi8qqPPfYwmCIzY0ZrnXoB0v2bE3OUvIsxGKXkqWae1b9VVqTq+j2ThWjjdO+S9H4AZMkP4TyvbnsM1tzM0559Q/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/4IyTuQ6utoZnHFaRXcWgTdGqaNWZ5Rh7yIldRw/XW8=;
 b=UnOo4elmRcfWdXgnWNJmksWKvndGO8DXJ5/BDzBA8XcEW8zEhZikO4GAWxKCv0yrGTuEz0MOVFnQvw66K2aN+zqHrIic9Ujrbx0ceNPLYMnsUpCkmBcUwb8JOMpZJ5O1CLtpWqBNzLD4/Iuzog1PuNe+igSDg0e4xZxxrZRQO30=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CY1PR12MB9697.namprd12.prod.outlook.com (2603:10b6:930:107::6)
 by DM4PR12MB7574.namprd12.prod.outlook.com (2603:10b6:8:10e::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.18; Mon, 20 Jul
 2026 07:41:43 +0000
Received: from CY1PR12MB9697.namprd12.prod.outlook.com
 ([fe80::3a41:55a0:8203:596d]) by CY1PR12MB9697.namprd12.prod.outlook.com
 ([fe80::3a41:55a0:8203:596d%6]) with mapi id 15.21.0223.011; Mon, 20 Jul 2026
 07:41:43 +0000
Message-ID: <76e27688-1a3d-4cd8-b3b7-58c47f92b8a1@amd.com>
Date: Mon, 20 Jul 2026 13:11:35 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] i3c: master: dw: Drop redundant core reset name
To: Shubham Patil <shubhamsanjay.patil@amd.com>,
 alexandre.belloni@bootlin.com, Frank.Li@nxp.com, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org
Cc: linux-i3c@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, michal.simek@amd.com,
 radhey.shyam.pandey@amd.com
References: <20260720073510.1869623-1-shubhamsanjay.patil@amd.com>
 <20260720073510.1869623-3-shubhamsanjay.patil@amd.com>
Content-Language: en-US
From: "Pandey, Radhey Shyam" <radheys@amd.com>
In-Reply-To: <20260720073510.1869623-3-shubhamsanjay.patil@amd.com>
X-ClientProxiedBy: PNYPR01CA0071.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:2ba::8) To CY1PR12MB9697.namprd12.prod.outlook.com
 (2603:10b6:930:107::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY1PR12MB9697:EE_|DM4PR12MB7574:EE_
X-MS-Office365-Filtering-Correlation-Id: 8a76105e-951d-4f15-3cc0-08dee63257ce
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|23010399003|366016|18002099003|22082099003|56012099006|4143699003|11063799006|10067099003;
X-Microsoft-Antispam-Message-Info: ddrTID4jQqvczf3+POmllrUcsxTkZdOSZtOMfuGowYD1j8WodtZD/YYXGCfQXZy+KJQ6AVLAdGJSFYYI2U0VH/E8GewjApBtUjtOMP8ynVpE/fpTX47T4HIw7FRb+fez2iKCyL3PIG+lMPww9cys6xX5p28MKcjmQ7kOTOt0EvXyftY34gAO3I3o2qExPJNh5E0NjnFZ/k5LFEzMPVRS2Pn8q0kgCCkq/UEEhd5Eln0PDvoTfq+Cy449Yb9SNmIO8Hj+nxk0pebjn7FSMMCrA7FxTNpz6sy5APwTv7Gl9iYPmCVN1Xr5g43NE9OF7GON9utGx2v1SyEUbJIq3BwaewSrEbBi+BJxFRk6/EwA6zwQUMZuAlepuWZzJpkDC23QsAhLS81fmCnMcVxt95zSaUu6gjTtSqC+dh2hnPonnkPxRVPJSrfmcgI0dbTdOEjWskL5kbEIMaHn8N7PuEYTWFgyf5NKOok7mKQsl6WJ7nGtNdqWIJQ7nZcsjgr2jyx6Hv2RWeXYycbT2PB5nRONFioKxEJACQM+a/dVPG5mCXsYFryJRBXCVrUZ19Kir98yaCmNUrh0eRqTpALRlmhfpju6hdkP1SamhRP6/z69NzVPHvLvYVMxTLqT1/cMtbkpDCUwMbYsRdZgtO+H+4lz87wdTNuYg6Lqz1KcpcgWXRA=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY1PR12MB9697.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(23010399003)(366016)(18002099003)(22082099003)(56012099006)(4143699003)(11063799006)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dEgrNjJHL2I3akN1VUhwZzBraE9CbHdkNlFvdjAydmRiV0ZjOTc2K005YUpR?=
 =?utf-8?B?bnRpWUR1OU10T1p1bVZGV2FCMitzRXNKK29lYzNXajJTdEN4NEQ4SWhTU0Zm?=
 =?utf-8?B?ckVFaGgxWmMyOTY3TnpEQjM5RXVnZUVvS3FtOXlSOXI4Y3FnOGVaYXJHWVRY?=
 =?utf-8?B?ODBCdnZqTFJtSXpYYjFhemlYZDdBUW1WanRNSFJyczRTUXJuVHk4U3lvUHc0?=
 =?utf-8?B?cmY2U28yTVZITENvV1FIaW5mdXA4QUlHYUlyWndmTUxKbDlWMVVHWUxNV2Jt?=
 =?utf-8?B?VnlkeWh0Y2ZObkFSVDllbEtOVWVYWGRxSzh3R0tUR21mTUdUdXNHQ3o3VTFq?=
 =?utf-8?B?bUVYWXpWZEdCT2cveTNYK1REYXVOU1VqUEdPRHFjUVhXTFJvb21vNGF1RXFG?=
 =?utf-8?B?ai9sK0JXajlUVWZlM0dQc3JUc3V2d2VtQmNNN3ErODRyRk5jQTZidkljajZp?=
 =?utf-8?B?dU9iV2RXUEI5aVlCZ01qVGNhM21kK2ZOQVlIWW0xaEcvb3NKRjV1eHVUUWJm?=
 =?utf-8?B?T21LMkxidmhuUDF3bjdFOFIvdWpWM1N5eHJid1hFanQvY3hTTkc0cUtlQzZT?=
 =?utf-8?B?SlRlWUNFOVlBZ2dGbEM1Q1p5UWRlUHAzeFBsQUJ4N3pRbCtydVBRTDZteU04?=
 =?utf-8?B?TmMzQ0x5YUtzeVFDcE1UVFYrV2NKNkd4RU00V3dJRVFoUUFxYVJHQTdTb2h3?=
 =?utf-8?B?a3NMRjIwVndvUzBZVG9Bei8vRmhNQW9RT3JRMGwyeHdkWTNXVEtMSm0zNDU3?=
 =?utf-8?B?NVlOS0YwakNVTDh6WWlnZGduY1BxWmZ6ajlISFhxUUQ3dnFHcm9jNE9kWGs5?=
 =?utf-8?B?SFpjeVdRQlNOMVNiYmYvc2VnWGxXMzBlV0h1bDI5LzVhQkN5RHp3T0pKUDB0?=
 =?utf-8?B?b0YxQzhMRXkraWVmSFRsZFBldGk4YnJ2Y1BsSDR6L1dja2IwVlM3QW5kUU9s?=
 =?utf-8?B?dGxES3VqUUlJR1M3VTNJUWhTNVluY1hDRkh1SHdpN012VTE1MWI0ay95eEhx?=
 =?utf-8?B?UWJmcjhvcTlTeXlMNzNnT050TVBDMmYrcmtsOWNCUlNWc0JhUXAwNHdxL05G?=
 =?utf-8?B?MVNzWFFhWmJWSis4WWdnRkVxdFlBcVhVb0ErRzAvMFNlRmNxMlMwQzBUdUNG?=
 =?utf-8?B?bG1HN3dtOUZqN2w0UUpOZ0lPeHdnM3hmOE1DR1JKTldPN3FHVStXdkkwbGt1?=
 =?utf-8?B?TkV0Yk5VenhoNTJmWnAyMGRnNjBCbmplbjY5Z2F6akUvS2pjTmxLSjBWaFpr?=
 =?utf-8?B?ZW9YVEsxcXVQZDQvaWpUcVV4K2xKWGxqMmlPZjlPa2pJWTFqaG1HcVNUK2RQ?=
 =?utf-8?B?Q1hQWGN4d3VWRzlWRUpBdUg0VTg4K2pUWXBCY0xLd0VEbWlUV3N2VjlybmJw?=
 =?utf-8?B?bmRlaWxaSGVVTkZscXcvRHlObW5rTkhzTXVkS0JhaURhbWxQcmw0anQ5VU1S?=
 =?utf-8?B?YzRjQjJqNUxjOVRJZzBYVXkzSGMxeVJHcHVkdUR3WUtSV1pURUZxbyt3RC9X?=
 =?utf-8?B?elNiTUdUWkYxYkZLTVo2U0xoOWh5MXZlbUtPVStaN0p0Y2RXSlZ6Z0ROZjlT?=
 =?utf-8?B?dzJ3MXF1S2lWN1c1YnpxWTB2UDBXYm5aMnRZYTRqNkMvSVVoS0JnRHhPUU9o?=
 =?utf-8?B?ZDczK2dhKzlDb3J1ek5RdTJqM2lSL3FGZTJvd3V3ZWZFbWRocnFmcGJEYVNQ?=
 =?utf-8?B?NHltMzcrbjRGcFNMYUQwSDVvUnBKYy9tdVBUTkJmYnU2RXNMaG1LTTI2emRD?=
 =?utf-8?B?T2xtRVZzMUloZjBuTUQzdk1lMlQxeTFBTFFoS0N3alpmZlhZRTJWc0YyUUF4?=
 =?utf-8?B?dWpiUkNlMzhxZjE0YnpHb2Z0MzBOZThBcVltRGtuZngvVzNvMHJGVW9wdVA2?=
 =?utf-8?B?MTBpSWRRQW9nSUdTek9ESUVUb1dmbXhseUw1YnZXV0ZzUmU3aUJBbVZIb3RH?=
 =?utf-8?B?TlFnWC8vWDRicWphMmxoQnM4NTdkdXZXa0RubitVc0lmcEU5N2hBODNybkcz?=
 =?utf-8?B?R2g1dDF6eTNnODVnbGZpS3g4MktmOGFpZjdYZWNncFR6U0FUL2t1LzV0MU9L?=
 =?utf-8?B?SzFCSi9wZEF4Y29Jd0N4TkRRNzJoVW44MC9senVIUDFtcnRyaG93NXZHdC8z?=
 =?utf-8?B?WUIzbldESnJxVHFiWFpnWERsOGs0a1RncXpEbmNuUXhNU0dSTnFyeGJ0Vmdo?=
 =?utf-8?B?bUZuTFo0MG84OUdnWTZUd3JSK2Jleks5cTJ0eDJxQWtXNjNXQUtRU0FncHF6?=
 =?utf-8?B?SGIxZkdBNFU5b3lWcG1yVndWUnp3UXQ3Mk1MYWRQdEtaeWF2N01lMVdVcndY?=
 =?utf-8?B?RXBVN1QrTHNEaCtHRG1PRHA3TUpuWkt5dUxhRFR4WGVpNyttazF1UT09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8a76105e-951d-4f15-3cc0-08dee63257ce
X-MS-Exchange-CrossTenant-AuthSource: CY1PR12MB9697.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jul 2026 07:41:43.2493
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aMHrzCbossQByGmBOiNUJkgD2066zDlRI4l0UfnEVH65iTUnPY2xPL7+M7b0mISf
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB7574
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260720_084153_450350_DC67EBE9 
X-CRM114-Status: GOOD (  13.34  )
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

On 7/20/2026 1:05 PM, Shubham Patil wrote:
> The DesignWare I3C master has a single reset line, so a dedicated
> reset name is redundant. Look up the reset by index by passing NULL
> instead of the "core_rst" name.
> 
> Signed-off-by: Shubham Patil <shubhamsanjay.patil@amd.com>

Reviewed-by: Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>
Thanks!

> ---
>   drivers/i3c/master/dw-i3c-master.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/i3c/master/dw-i3c-master.c b/drivers/i3c/master/dw-i3c-master.c
> index 2f8c0c4683e0..488fb455d3cc 100644
> --- a/drivers/i3c/master/dw-i3c-master.c
> +++ b/drivers/i3c/master/dw-i3c-master.c
> @@ -1584,7 +1584,7 @@ int dw_i3c_common_probe(struct dw_i3c_master *master,
>   		return PTR_ERR(master->pclk);
>   
>   	master->core_rst = devm_reset_control_get_optional_exclusive_deasserted(&pdev->dev,
> -										"core_rst");
> +										NULL);
>   	if (IS_ERR(master->core_rst))
>   		return PTR_ERR(master->core_rst);
>   


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
