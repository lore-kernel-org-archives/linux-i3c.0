Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49EF3CDB46F
	for <linux-i3c@archiver.kernel.org>; Tue, 23 Jun 2026 12:58:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CAK1v0GMEfurR/GX1cd0mdZq7ZWH/DPDuoJZLqo31XU=; b=V+hRqUJeFPdjt5ZmXapI35Bi9u
	gOdHARWRUwhpType6OlgZARKDKVdqpJJWh/KQKh/7TdiONuzJVNllH/ZgX+ehvvTvkLCxc5a/um6a
	N49VxBFLKT9ePvDb3HpbF2FYvTRR1PIW02WD0b5COJ4IzdR/fSv3z0hdN72NBgidhIUlLzIdqIIDm
	/cA6lyrv4ygrj4911eNX4xxJcnlM+sw9MDSc8aeiQbx/uco8MdS1Rq6YvIDPeNo2OJ/TSePeGOQtj
	CAXv0vpkJ+GhwB/e1HN2QVmvHbPB/wTDwILsdYxjijChvdhVOW/k2UxMir9rSDSF2JK72PHVehYTD
	yhF4GFQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wc0hr-00000006Ii6-46dD;
	Tue, 23 Jun 2026 12:58:23 +0000
Received: from mail-westus3azlp170120001.outbound.protection.outlook.com ([2a01:111:f403:c107::1] helo=PH8PR06CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wc0hm-00000006Ifr-34wi
	for linux-i3c@lists.infradead.org;
	Tue, 23 Jun 2026 12:58:22 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=o7Umb4eHC824hPhF0JayekfqYG44WswqkjeAEUHUAzbu/qw5qtv75vaqdzUgUwy6mLjIZKaWSgrfQFdleq3RlaYATmIsEGhxohF/GFrMJWCig3BmfeJxdIRugk2hT8lpMpF8dV/TKk4BpB0m4dO+2Ji3gQ3NzgIqq3d/kbpbHdK4ybpBrXm6PdUzXl2BkQcL2CIFa+BkiaVGT/ShylRtq4TprBlZI+p3i0rSBP1om32pBcD4g1R6rdZQqMYluhVIrqbAx/HOqifMURWAFQBu3sRbkkTluCbDur/YRB+27j/WRj/mG53T47lx2pDEbsgagQdcNktn9II8dfubRYi1PA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vPuQsbQkIPI/NlVw9YGMUnTXxbgFeVAa7jmVF9hoPV4=;
 b=ogn7oaRoUG8sSCPfMgyzclgy3JjRaEEc9UFaxnZVwVcEjPi5edxHS+KUoHHGdtdRxQzH5NKF623kbggPELiVdk0/apniXvNyoSUFjQAzD8NdrgPjcuyNSrk88Ndh2G/HWD0H0T8Q2ABtmdyVMZgw7ZrU6wSOs/xiYtlxH0kxRfzrUBUQNna2KPWij9e6KM9L+IshtQosqgRh6yYVmnUnIA/VgfAZlUHLw2ZNmLwFtnUz+h4TTk/Bu7AFbqOaRKprqrdTjXIH1hK3weglOLcU6yIxXAOiyt/wasE1rYXOxH+3QhQMmt28Ji4oaPs2xaADHFiQfCplLbgN8I02LMRXKQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vPuQsbQkIPI/NlVw9YGMUnTXxbgFeVAa7jmVF9hoPV4=;
 b=plXwWFFcJMHjA5vuNaLGiiOvHjhgiXHRwwBY+E6zOHGhdQ7nE02aqtwXZc2C55P/Q1Hkl1IuusG3tCOMZtC7FoQ4ya2W3+z1MkwvYdj7OsXc+kjnWeZKiJnMkuzNRmgR7JaYY3ThttMZQ0Lb5HR/87eGzFlLglnEVMqrI70cPQo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CY1PR12MB9697.namprd12.prod.outlook.com (2603:10b6:930:107::6)
 by IA0PR12MB7628.namprd12.prod.outlook.com (2603:10b6:208:436::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.139.20; Tue, 23 Jun
 2026 12:58:04 +0000
Received: from CY1PR12MB9697.namprd12.prod.outlook.com
 ([fe80::3a41:55a0:8203:596d]) by CY1PR12MB9697.namprd12.prod.outlook.com
 ([fe80::3a41:55a0:8203:596d%5]) with mapi id 15.21.0139.018; Tue, 23 Jun 2026
 12:58:04 +0000
Message-ID: <615e7975-14f4-42f7-bc8f-e3bb0e977ebf@amd.com>
Date: Tue, 23 Jun 2026 18:27:51 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 1/2] dt-bindings: i3c: Add AMD I3C master controller
 support
To: Shubham Patil <shubhamsanjay.patil@amd.com>, git@amd.com,
 michal.simek@amd.com, alexandre.belloni@bootlin.com, Frank.Li@nxp.com,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, pgaj@cadence.com,
 wsa+renesas@sang-engineering.com, tommaso.merciai.xr@bp.renesas.com,
 arnd@arndb.de, quic_msavaliy@quicinc.com, Shyam-sundar.S-k@amd.com,
 sakari.ailus@linux.intel.com, billy_tsai@aspeedtech.com, kees@kernel.org,
 gustavoars@kernel.org, jarkko.nikula@linux.intel.com,
 jorge.marques@analog.com, linux-i3c@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arch@vger.kernel.org, linux-hardening@vger.kernel.org
Cc: radhey.shyam.pandey@amd.com, srinivas.goud@amd.com,
 shubhrajyoti.datta@amd.com,
 Manikanta Guntupalli <manikanta.guntupalli@amd.com>
References: <20260623114417.2578189-1-shubhamsanjay.patil@amd.com>
 <20260623114417.2578189-2-shubhamsanjay.patil@amd.com>
Content-Language: en-US
From: "Pandey, Radhey Shyam" <radheys@amd.com>
In-Reply-To: <20260623114417.2578189-2-shubhamsanjay.patil@amd.com>
X-ClientProxiedBy: MA5P287CA0237.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1b1::17) To CY1PR12MB9697.namprd12.prod.outlook.com
 (2603:10b6:930:107::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY1PR12MB9697:EE_|IA0PR12MB7628:EE_
X-MS-Office365-Filtering-Correlation-Id: 7391f7d2-2383-46d3-f831-08ded1271096
X-LD-Processed: 3dd8961f-e488-4e60-8e11-a82d994e183d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|366016|1800799024|23010399003|18002099003|22082099003|9063799003|3023799007|921020|56012099006|11063799006|4143699003;
X-Microsoft-Antispam-Message-Info: /CXUVivMH87Ik5nHNfqCaAFVY8xur5tAdxJKSpaK68R/uYtCSTzWR3aE8y5fd8ox94PZHYFrQ3ctnGIu7n5x7RJ8WD5lCkyOpK/aEMqKVSOh2H8Xbx2L2yN28wnzhZ8/o5yt43LLIxY2hZjWPDEnzKO38Nd+gc98NH8YpRwa6jNv8ohNIdy3kbcQJ4+ivWAHEwEt5Abqr01EM7rlJS6N4VrvaKzWOXbF/dC+r4E04EnYFesIb0HKujKEcHZ3yQ0OR9SOpvB67UdTlUJEtvgsBZtdrEwnjoAK9+QqVlelr7U5OuJlzkhwks4+MNf/pA+L0OIOUS0iCuZBeFYAivDp3XMKKh/zS1pen5TvS2k+nyCmvfrIsoSiL06h9tAV/hNoidDmCSFQx+jEP4QCOlrfUMrF7WjbpJXVPk1wnq1M4IvyfPqAXow4LRvIY/PIo3oNd/AuTEX0pqzTFPAYTvC3MyJcC2BkiIcsXLH4i2s1YeaOTwhIUis5+myRjyK4dIsPtjIxh8xX++iDk2wl1rtZd2X01phx5Y3sqNCvfB0+csGGSErsHB9tPeKOidSfexIiV08kf2tv3gqwhFF3OYtrJ4wjrLlgNJF4rukoruBneksMZaJCbD/o7yg60DCF0cnwGpBJF9ubDfuV0YQ64c8qtu7Ots+Rt3P1suiBqvLwoHQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY1PR12MB9697.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(1800799024)(23010399003)(18002099003)(22082099003)(9063799003)(3023799007)(921020)(56012099006)(11063799006)(4143699003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TjZDcFZBdzBsUU4wc0F1cDZKemZrWXNxamdTOGhvY3JUbXA3ZC93VllnQXBu?=
 =?utf-8?B?TUJXaDlZREtmd2xoRGVKQmVQOWVCODNGRkliVlEzQzZOYVVTM081SktpR0du?=
 =?utf-8?B?WVIvR0RXZHA1cy9xOHJZbTBJZmNKU3FHNlVTbi84TnYrSDc0Yll0ZTUweXR4?=
 =?utf-8?B?OGdNU2dBd2QzOVBlQzY4WjkxT0JiZmRzMDhJOVFsR2tKS1ZTSFcrNnRXZ0hU?=
 =?utf-8?B?MTNnWmluRE1ScE93Y3pvZFlrd0d0Zk8vOFpZMVlvcXUrdzZLQ3NVVUN6ck9u?=
 =?utf-8?B?N3VZR0ZzZjJpUmRvWTJRcWpCdzg3aDB1Q2NTS05IM3VCdTlFUTZQbjZPalhx?=
 =?utf-8?B?Qnl5djZBVWhCZEZwOTR2TTl2UG5nUkNHQXI5UENiclNBRHgzSFpMTVBMNWpG?=
 =?utf-8?B?UjNxanJxMlYxbUFEQlUwK3Q1OWNJQzhPZ01JdDhnRll0aitta3hzZ1FGUVg3?=
 =?utf-8?B?YWduVUZ4UHFzWllzdElodC9hMVVWblBmOHIvbGV5aXdKVHgvaUI4YytFMmJN?=
 =?utf-8?B?OG1lelI1QklxVFlkRVAxMUNmckxEN2htWDBGRWp5RzIxNlhJY3p3V0VJZytQ?=
 =?utf-8?B?Y1BPYUVTTktKZDNuemVwaFR1S0U4TGoxWjYzSW94V3dHSy9ZVkFZK25Yc2lI?=
 =?utf-8?B?ZFJCVzhXRG4xenVjdUduanliSTB2R2FWcXV3bjlCZUg0NnJZeThjQUdveDJw?=
 =?utf-8?B?VFBoME5vR2I1QUFESHFWVm1xWTZESC85NzBPWlFrdk9tcmpGTVpIT240b3Uy?=
 =?utf-8?B?TmNQVzBFcEE5MjNjS0ZXK3Vyd3NqMVVQNGR0UkpDcDVuaEM4V25EUlRoM2pV?=
 =?utf-8?B?YTE5NTF5aEp2a3BLaFAyWEVaRzFOQUUyK1dpNWxpY3l2NFJFVDYvZ29ZaFpy?=
 =?utf-8?B?ZzFNeDBHN1dnQ0IydUxXak5TdzVOenpZTTJycWsvQUxDQ0p1WGtyRXp1Q3Rr?=
 =?utf-8?B?bElsdUJYY3Vwc2JhaXMrc2hMcmhXS1c3UUpobWQvTDdrWUJZcWxPVTZwUjhh?=
 =?utf-8?B?TVZsQkhidW43ZUpSTWYrNFRNb3pacGx4TXNSNVZrK250MERXejZoREY5VlhQ?=
 =?utf-8?B?VnJKbGtzS055ZUNVeWZkdHhEZFNaQlN3TVZ1TkVWdFdhaUx5Vk52SzV0WDFl?=
 =?utf-8?B?ME43Zkw1dDB4TlVNMUhqdVFiZWY1RWlDSU5FektqS2dDelYwbHVwRDY0YW1M?=
 =?utf-8?B?OWZpSDBsekJHM2tVeXVRNjRJVDlOQ0h5Q0NubVZYRkpSNitMZ1JCSW9FK3N0?=
 =?utf-8?B?Z2Y2Z3o5VHpxQzlVZ0lpUC8xUDUzemdlYzRicXdzR1VQSFpEZ2t0Wkp0eWht?=
 =?utf-8?B?NWRzejZ2eFA3bnY1TVB5NGNIU1JPTzZ6ME9yWG9LaktYNUZlS21RK3dPNWVU?=
 =?utf-8?B?T2M2cit3aXJ5NmdmVktjbGlQOWxYcWF6L3VUbjd4OWI3V1NuMWZFa3Yvd3hE?=
 =?utf-8?B?TmRXeTFKRHlvRW9DSWtaODJPdnNvdC9hTWxnV1ppSFlLRWsxSktsQUQxREFw?=
 =?utf-8?B?SU5lbjJPOUthTTBvRDQ0MU9POE5CYlRMWWdIeCtDYzQ0N1d1V0g4RXZ3Ukk3?=
 =?utf-8?B?ampiaGI1cTBPUEVmMDZqdGtaT252YnhhVnlkeEthelpDUGwwRTRYOVYzeHBz?=
 =?utf-8?B?TGJEMklNNkhjMjROVjltZTF5K3hFOUI4YkdtOEcxNW53QnkvZlVJczJnenpu?=
 =?utf-8?B?UUpFZUxPMWd2UlRBbStLYlZjenhadm9HSHZhK3hsQmIyZFlrek1vdGFpTUc2?=
 =?utf-8?B?dFlLcklsajNGS2hEMFlnRFNDM2YwNENkcUV1QXlZdnI1NHhTMnNuQVpGdjNh?=
 =?utf-8?B?MjR3YjJvS0tyZlVLUktaOUdXV0lFaUZMS0M1enIzTW5wcUtFRnZkZDJPOXZX?=
 =?utf-8?B?Q2d2RnBOaXZNdVh6dWpoSzJQV0VuVUMxRGU1WTFtK2h6OGg3cThjbHF6TnZi?=
 =?utf-8?B?RHBrSTlQRXFReW1BZkdjeCtqUUx1MzNkRUVJZ1BZenJjVVl1d1JWUG91NWFz?=
 =?utf-8?B?UlZYTE9XbjUzVVZuc3IvcDFCVkV3ZllkVjh1UUtQUmZ1citjblI5NnlyVVA3?=
 =?utf-8?B?dXJ3KzJOc1pya2VaOXVkSjBReThQZm5oWFZUT2VOR0lSbFM4OEN2dFpnQVBv?=
 =?utf-8?B?QStBUUF6d0FZNSt6U1I2RFZMc3NST1MxMkx3VktuQXhNeGdreUFnSS9uTlVo?=
 =?utf-8?B?VjNqVHR6ZGlBUlo4K05kcENCWmxLdHprVloyczVkek44NTJNOGl1ZG9jTzB3?=
 =?utf-8?B?Z0ZyN3JZamxwOW5tTUZmeXN3RnJFV1hWUUN6Tk9ETlM4cHpmS0R0VkVWVTMr?=
 =?utf-8?B?Y1ZGa1phUWdTYzdqMmU0Qi90dWFkZUNQUnlwaDR6N3ZYM2tybGZaQT09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7391f7d2-2383-46d3-f831-08ded1271096
X-MS-Exchange-CrossTenant-AuthSource: CY1PR12MB9697.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jun 2026 12:58:04.8267
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xNL+sLBMquriAocYt205jjjvOKg7CaCnD1BNDNT/5BC80/CrTkHGflKBATi0BLBm
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB7628
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260623_055818_781941_F9785CB5 
X-CRM114-Status: GOOD (  20.13  )
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

> From: Manikanta Guntupalli <manikanta.guntupalli@amd.com>
> 
> Add device tree binding documentation for the AMD I3C master controller
> version 1.0.
> 
> Signed-off-by: Manikanta Guntupalli <manikanta.guntupalli@amd.com>
> Reviewed-by: Rob Herring (Arm) <robh@kernel.org>

It's missing your SOB.

Any further SoBs (Signed-off-by:s) following the author SoB are
from people handling and transporting the patch, but were not
involved in its development.


> ---
> Changes for V9:
> None.
It's not correct - you updated maintainer section in yaml?

> 
> Changes for V8:
> None.
> 
> Changes for V7:
> Added i3c controller version details to commit description.
> 
> Changes for V6:
> Corrected the file name for $id in yaml to fix the dtschema warning.
> 
> Changes for V5:
> Renamed the xlnx,axi-i3c.yaml file into xlnx,axi-i3c-1.0.yaml.
> 
> Changes for V4:
> Added h/w documentation details.
> 
> Changes for V3:
> Updated commit description.
> Corrected the order of properties and removed resets property.
> Added compatible to required list.
> Added interrupts to example.
> 
> Changes for V2:
> Updated commit subject and description.
> Moved allOf to after required.
> Removed xlnx,num-targets property.
> ---
>   .../bindings/i3c/xlnx,axi-i3c-1.0.yaml        | 56 +++++++++++++++++++
>   1 file changed, 56 insertions(+)
>   create mode 100644 Documentation/devicetree/bindings/i3c/xlnx,axi-i3c-1.0.yaml
> 
> diff --git a/Documentation/devicetree/bindings/i3c/xlnx,axi-i3c-1.0.yaml b/Documentation/devicetree/bindings/i3c/xlnx,axi-i3c-1.0.yaml
> new file mode 100644
> index 000000000000..75f677696f02
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/i3c/xlnx,axi-i3c-1.0.yaml
> @@ -0,0 +1,56 @@
> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/i3c/xlnx,axi-i3c-1.0.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: AMD I3C master
> +
> +maintainers:
> +  - Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>
> +  - Shubham Patil <shubhamsanjay.patil@amd.com>
> +
> +description:
> +  The AXI-I3C IP is an I3C Controller with an AXI4-Lite interface, compatible
> +  with the MIPI I3C Specification v1.1.1. The design includes bidirectional I/O
> +  buffers that implement open collector drivers for the SDA and SCL signals.
> +  External pull-up resistors are required to properly hold the bus at a Logic-1
> +  level when the drivers are released.
> +
> +  For more details, please see https://docs.amd.com/r/en-US/pg439-axi-i3c
> +
> +properties:
> +  compatible:
> +    const: xlnx,axi-i3c-1.0
> +
> +  reg:
> +    maxItems: 1
> +
> +  clocks:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 1
> +
> +required:
> +  - compatible
> +  - reg
> +  - clocks
> +
> +allOf:
> +  - $ref: i3c.yaml#
> +
> +unevaluatedProperties: false
> +
> +examples:
> +  - |
> +    i3c@80000000 {
> +        compatible = "xlnx,axi-i3c-1.0";
> +        reg = <0x80000000 0x10000>;
> +        clocks = <&zynqmp_clk 71>;
> +        interrupt-parent = <&imux>;
> +        interrupts = <0 89 4>;

Nit - Don't use hard-coded numbers.
> +        #address-cells = <3>;
> +        #size-cells = <0>;
> +    };
> +...


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
