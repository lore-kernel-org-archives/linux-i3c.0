Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A915DD41D6E
	for <linux-i3c@archiver.kernel.org>; Tue, 12 Nov 2024 08:52:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:From:
	References:Cc:To:Subject:Date:Message-ID:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=2unVI+1ItcYXOYZZIgsiJa1U9y8K9MKi/+2h/QS70ZU=; b=02pIGLgr6mvOueaBQiDOcfrhj/
	j94qzrqeiL14RoHlQScHMWvM+PKvxtLXXHGQ/LX1M8SQJei8TpDDgdRCjvDzRZc8w3X+MANuJIaOP
	MjXThSH0R38zO9Q15qiwhehkBOhc7ne+ssgK+5sNunb4bEctX/njXsKs7QdUQ+zMajDLcwomzJI4Z
	jptZlfC52xkv3ddtD33Q1CX5VcsoC5DSrJohavluHcSEXdsDyzjpHgVmwWBqXMpOk9K3zzQdZ8lZo
	V6YDysa16/g3H5HWWUUEKqxRcvF5ZZ15ULSCX25D35UAS9q+OdEyQ5Q4puSjqleSBPME7boHLJ0cV
	yQsJFijQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tAmdc-00000002iSu-1VGR;
	Tue, 12 Nov 2024 08:52:40 +0000
Received: from mail-co1nam11on20622.outbound.protection.outlook.com ([2a01:111:f403:2416::622] helo=NAM11-CO1-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tAma6-00000002hUQ-208v
	for linux-i3c@lists.infradead.org;
	Tue, 12 Nov 2024 08:49:03 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=y0bujf2v4WPv5o75PpqJ8qv7iPWxtYplTGGxXV4NCECISCfM0zMAotQvblpSoUr32TzCnCAZ/icug4diiqK4PY7J2pfruqet11V6dGT7V5VBjZf1hooTOM7fKZfpnf7e5E4bA0Qtxekm2RmVslrI36pjAvue6dzH0z+ALQ98QPPnV5pLrMu3GzAj4/KTjGKxwCWvIfly5QwsUgLhJ4TPlqRIMyJ5VxaXnXlnkJWSDS2yi54p6sDdmxJx9Z5CK+jwdGc3PB4Lo8rRbBffkJ1Z+6B/00Rq5PLpKbpa7stnQy7sjqq4+9ZrS4agXe+PiSzJyj0vEqYAcTg8hQpaVCuXZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NTMSVWNAqIFW9v3ZW6sAxdeREPimgiGVwuJk6B9pt4A=;
 b=vPvM7NU4mvj6Sr01b8Zya+9pb7KkRyL+Ok2H77ouqdA4FMqyJfmDDmyS6O07MhQXo2pcO5iFQH98aojs9PpB9+VArrtJLGNVwwQXIJSHJQc6BxIEikTKrsxzsycJU9VqQMJkKRW9fiJHV79s+ERpBbp14Apb19cqVHBuh4O/o99g3OU2Hxm/3HHNfgWcXhM5TuMMcwVxH0F59xQVhhQ6J0uK92l73+VuXT6eiLF0romzOTGmrAsY0Q5KKTbCZ5PwJSGBi8yedZC0rYw/th0R2Pkhmb04SSPkqK12GxCkqpctUqbdUB6BhafD6Dn1rcCsojIguq1lyB9MLHccTDNxEg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NTMSVWNAqIFW9v3ZW6sAxdeREPimgiGVwuJk6B9pt4A=;
 b=xrHr0m99uM5figv1+IU16CX690BHIonMmVJrsPGjq8Yu5Eqz6dXORyZl/rifU7UjAID5Gptsb9wOMFjJmee4QLkRXI3pHyyM5zwxWczg70XZNuL/WCN7mmTiNh2olTMgwWwgNeZde8gMzo2PhEphUqcjHGuMGO+ee/YYTg5AMPM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BL1PR12MB5176.namprd12.prod.outlook.com (2603:10b6:208:311::19)
 by SJ2PR12MB8883.namprd12.prod.outlook.com (2603:10b6:a03:538::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.27; Tue, 12 Nov
 2024 08:48:56 +0000
Received: from BL1PR12MB5176.namprd12.prod.outlook.com
 ([fe80::ed5b:dd2f:995a:bcf4]) by BL1PR12MB5176.namprd12.prod.outlook.com
 ([fe80::ed5b:dd2f:995a:bcf4%5]) with mapi id 15.20.8158.013; Tue, 12 Nov 2024
 08:48:55 +0000
Message-ID: <507a8af4-f128-4d73-9d0f-b8a6a15603d3@amd.com>
Date: Tue, 12 Nov 2024 14:18:47 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/5] i3c: dw: Add support for AMDI0015 ACPI ID
To: Jarkko Nikula <jarkko.nikula@linux.intel.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Sanket.Goswami@amd.com, linux-i3c@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20241108073323.523805-1-Shyam-sundar.S-k@amd.com>
 <20241108073323.523805-2-Shyam-sundar.S-k@amd.com>
 <09cfdd95-c566-4379-be17-2d5e0f0e8357@linux.intel.com>
Content-Language: en-US
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
In-Reply-To: <09cfdd95-c566-4379-be17-2d5e0f0e8357@linux.intel.com>
X-ClientProxiedBy: PN3PR01CA0175.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:de::20) To DM4PR12MB5184.namprd12.prod.outlook.com
 (2603:10b6:5:397::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR12MB5176:EE_|SJ2PR12MB8883:EE_
X-MS-Office365-Filtering-Correlation-Id: 79d7657a-41d5-4506-29e9-08dd02f6d6b9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?M1RKYmx2RTlaTzZBOEJCTkN4SlF6WEZWT1JxaHpIV3o2WlpwUFI1Q2dna2xu?=
 =?utf-8?B?MGJaRzUvOEJBSGZBV1ZjSXhadG9jRFNPclpOcVk1dUQvRUdRd2VKblNUMlk5?=
 =?utf-8?B?STQrYlV0clZOZmZqbEVNclM1VHovU3J1QlhVYnJhRXdaTnNma3c5eHovdTFM?=
 =?utf-8?B?cnpldGViM0p2WitGc2ZiWGM2b0dwZzdvRmlnbGVYeGhPZHVLaUJwU09UZ0sy?=
 =?utf-8?B?VmRFRER1N21DV1dqNGNEdWgvQVRGTHFDS2IwMGVsSi9JVStKM1JPNE1kNWRY?=
 =?utf-8?B?ZmhtVUVqcjlsaDBmanlNR2lRSTVJTCtFcjVZeDJSWGxFZ1Y4TmgrSW1ZRlRC?=
 =?utf-8?B?L3g4RnFpVWhPcFlrRHdwbUQ0OC9zZ2lGcEtZdWE5WXJWeTlTNW1iSWRBSGtZ?=
 =?utf-8?B?UDRpOE5PdFBBanhNbXpyb05lb1U3VVQ5Yk9keVdvK1k1N3k1S1JWT2Qvc3k4?=
 =?utf-8?B?QTdKMlo1VkR0UkdKYnBnUVZHV0IvQzZxVkVIZmJyQXNrWmhCTzBPZHEyd0hT?=
 =?utf-8?B?b0FUZTUwQ2Nid1hNSTUzUWhIUkVjUmcvbTEvVDRHQWhtVE91T01CbmxpL3Bw?=
 =?utf-8?B?RURXUVM5cXJzVklZM0VTZFh4TmlRTitPRHNLSjJvdDkxSXdNUlN4d01nai9h?=
 =?utf-8?B?c04yM0U2Wmd2MlhpQkU2WDVKSk5zSVN6ZlNuSytGM045alc4QTBRWWF1Qy82?=
 =?utf-8?B?LzBCUTZPUGpJKzZlQ1J5a2tNd1o5S0FheElsUTF3OFFlZGFWTmVjVVo0SEl0?=
 =?utf-8?B?ZFNvYmp5SnZnMk1NSUp3YmdKNGZmYXFsQ0FVOFUxRzEwNUg1L3Y4a1hENnRy?=
 =?utf-8?B?WU4wQzlFRGtzdUFRa3dDekNiRkF3OVRXbDhyalVpeGwweU8rdzJ0Qm5MZU5x?=
 =?utf-8?B?U2pIZXlZQ0ZXYzgvNGhWck5XMVR0LzFTdG9oSmswZU9URHpiUzg2em5VRXNS?=
 =?utf-8?B?c3NrUUhLaHhjM0tqU0JWbVA5SnU1bFEyZlFQeEZzK1kvV3FCeWQyVGlyYUVO?=
 =?utf-8?B?TloxS2cwdzVqYkRzU3FJb1VGc2VmMnlzMUx1VjFjbHgwTHBXWnQyc3hzUzg3?=
 =?utf-8?B?NGFsS0VzSnhMdVJJeHpCMnhKVVpMTzl2YnR1U3hTbE9LZ0ZoeUt3TG9TdSt1?=
 =?utf-8?B?MlNuUlVhK0cyMDloTmV4VytFeUhDUUVuaTcvU3FxVU1oZ00vb3k3Y0dBNUYy?=
 =?utf-8?B?VE54eTNuMGpTZEtuWlJsYmRjYndtOGpEUnRHUkZpelFXTDdjem5leGZlVUdp?=
 =?utf-8?B?RHR2dUJqQmwxdWI4ZmFRSVNhU3F3ampVQnFpb1R1WGNyOEhoaTRSVnAwcUE3?=
 =?utf-8?B?YmlJZVE4VCtObHIydGpReThTOFA1Vno2WlNWNzRpK2UrZE5MTUFzNXNpREIx?=
 =?utf-8?B?ekRCVHp6bFgrYmZZU3Z4b3cvNGNWcG04MGxqNFNjNjJPWE5Xa29Yek5wa1pu?=
 =?utf-8?B?bWlUTFlyT0NGS0tqWHhHRURHM056b250dVRPWXl1UTdmMFE1TThoQTdpRWYx?=
 =?utf-8?B?U2F3cFlZazBmazJtamZBS0dZcXVxTjRWN3grMVFvK09UMXBFMk5pVytEN1o5?=
 =?utf-8?B?NC9CNDdMdExGbm4xTmJPQk1YeUE1OUUralpuOFlDTU5OOVllQnlQYUZmSncw?=
 =?utf-8?B?UXMrQ3diaUxZemlnNnJZWE1halpPZzd2aVhWRGlSVTB0eER5TEEyMFBPRnNr?=
 =?utf-8?B?bUQrMVRiYW9yT29XWURicDRqaUFGVm4wem56REFTS05JcE1NTDMyc2l6WWl2?=
 =?utf-8?Q?incBv594ezqy+WRJ9gCFvw2vZHsOBFsoZPrlf2a?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR12MB5176.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NTlzeHVkZ1RoRGVrN2lEZjFNRUtVdG9VU3ZTdHJqZVNSaFRWVHMwdDl1Yi82?=
 =?utf-8?B?YXFoS0VUeCt0cCthSXdxRkZKMnhhak41dVhER25uQjViTDRvamptVkM2L3lD?=
 =?utf-8?B?NDVOR0tkWTZaeGtYZmlVci8xVVZrSUxrbzJ1VmNRMWgwWGN2QkRISHJiV0Zx?=
 =?utf-8?B?bXE5K3NWUVJKTXZLZ0c4MXVldStxSkR1eWo3dDYyaXFkcXFacER6WURtL29r?=
 =?utf-8?B?eE43QTRqU1I1ZkRCQ2RyeG03Qm8yR2RMSjJ1VTA1bjZSNjZMUm9QYXhlN2xW?=
 =?utf-8?B?VmtoL3BOanpmaUsyeEcxOUVlNytJOTRXQllNbm5zQ2xzU2JNcDVGV29jam5k?=
 =?utf-8?B?K2wzZXR1VTNTQ2g3Y3YyOEh1K0NsUGFkR2FJQS9NeFdKWnJjeWZPbTR3MDRQ?=
 =?utf-8?B?ZEtHODVyUjJpUHV2S003SmVwMytJVDFwUjcrcU8vSXdiU1g4OTZFancvRTJa?=
 =?utf-8?B?T1o3enRaZDJLbEQzVXYzbVhUU1phQlZLYjFnbkRtVDRib3VGbFdFb0c2V1Rq?=
 =?utf-8?B?ejdXVHdlVUkzVUxLd2toeE05MWlIWFA0a2RiSHE2aG1EK1hzVEI5TENZbjgx?=
 =?utf-8?B?OVRKRkYvQkFnQ1FCOE9zb2w5VlR2c2U4Yk0ySHZlL1FPNU41ZFhZTGxVa1l3?=
 =?utf-8?B?S0xLakMrbWJKMXBlM3l0Y1haaUd6M0w5bkY3WTFTMFdJR091MEhuTUhkdk9p?=
 =?utf-8?B?bERmcEgxZlZmb2dPNHU2NGhZcWZwTHJCRVp0MDltdkZXZmExNURvSTQ0MG4r?=
 =?utf-8?B?dTNLdnIzYjk3SmJ4MnJCVkRaMWJPU0NpelY0dWE5SHpXRC80bWtWditaTHo5?=
 =?utf-8?B?VWhLR205UUVFUGRPS0xxc2htRjU3QnhxQXpxbVFlS09jbERnZFVZcXNlZUgx?=
 =?utf-8?B?ajZMUjFJdnZPbXk0TWJZbXBISWxlVjd6d2lpUUp5dWJPSGlFUS9VL2c0TEIz?=
 =?utf-8?B?emdiNFdMUnJCVk80TGQxcENqd0xWbzBoL2Zyb0JzUlRQaHdTVXlPNFlvcFRr?=
 =?utf-8?B?OGhLQTAyRVhKeU9UY3dNR2xxUGRlUWh0czU1aHllT0ZTQ1VUZ3MvRW1NeWpC?=
 =?utf-8?B?WnNoVTY5RU9jUXk1WCttR3JidjJtZHZwZy96amZWb3l1RUtmQytQWm41aDJp?=
 =?utf-8?B?MHFOQWNSS0tUdnhJRllJV3c0U0tqUnBPZDBqdUErcEdNOVZlWlFFcmc1ZjNH?=
 =?utf-8?B?a21jRFltblloT3FGYnVaMjcrYURCUGUwMmVxL09XbnNYYUhSTkRHQTZGaUE1?=
 =?utf-8?B?ZU1ha2pmQ1hVZzZMM3dRRFV1UGhpWEZHdnd3RFJ5YkN0ZG1PRnhoeS9DT2tI?=
 =?utf-8?B?U1JwUmdOclNKdzYyU2tsRGRMaE9CR1ErNko5Ui9IUkp5STIvV0RkSzdPRFRz?=
 =?utf-8?B?eG5UMHNtejdFYWE5YTVLdWdueVFQRTA1R0YzQkw1ckpmTm5OeVRvUXI1Z1Vq?=
 =?utf-8?B?NXVyL0o1U1JSNkY2TVRycS9TZGUyMkhpUHNzNDZpNi9raFdNRmFDalBOSkx0?=
 =?utf-8?B?Rk5QRXV6UFdreEcrdXg5MGVQeU1xRkVlQnlTUkdCbkxCdzdZRFVMZjNyMjdm?=
 =?utf-8?B?ZXkzMVRzYUZuTFFicElpaHA2blpvWnc3MGo3UnVXUi96VjN0eU9ZSDVzRWpO?=
 =?utf-8?B?U1gvVWtHNGlCOHlaZGhGUEN0K0c3NzREN25tYzB0MVhNeW9XREJjbWRFOEho?=
 =?utf-8?B?OHVEd3ozMTQrSnN0YkxFQ1VocTBpWjhMNlcxSkZJb3lYSm4yM0lBeHdNWWUx?=
 =?utf-8?B?TmtIaEIra0lKcUVEOHRxMm81TWpsVXlFYkxWYzE4Tk03RlVKUzV0NXNxM1lv?=
 =?utf-8?B?ejYvaWYvdHozZjg0aXUvQzNEdTlkcDlpMzB6TFBOK25lRHg3aEtVdU84elp6?=
 =?utf-8?B?ZWhMbGNwYkw5ZlBkOVNGTnY2bDBaajdNdHRBemFkckJsRkI1V3lvVkhLWmh5?=
 =?utf-8?B?WVNNVWhDZW9UUVhFRDBJWHI3UVZicjJRa2pZVHRiak5RcjI5T3FHVXpDcVdp?=
 =?utf-8?B?UCs4Slp2QXZXcU1hMDd4aUh0RWplSlhJeXROQ0hPSjBMK0c3R2czZEF3RnVu?=
 =?utf-8?B?TVdCZGR0VEtWU1I2WkdHQkNsL2hmNGkzNmNIMVowZkpadGtURnd2MU1FOG40?=
 =?utf-8?Q?//S7NQ+MMic7djcD7RwQccF5t?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 79d7657a-41d5-4506-29e9-08dd02f6d6b9
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB5184.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Nov 2024 08:48:55.5863
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Kj4JgYCXUIbHCps2tNUKnSKd3pGkBSNwLNJykceOD8HzXamrKwNjNJ88/+GjKxTBGiGiDYGdpTVyBlz3BRkkJg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB8883
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241112_004902_545947_391E81BD 
X-CRM114-Status: GOOD (  17.29  )
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

SGkgSmFya2tvLAoKT24gMTEvMTIvMjAyNCAxMzo0NiwgSmFya2tvIE5pa3VsYSB3cm90ZToKPiBI
aQo+IAo+IE9uIDExLzgvMjQgOTozMyBBTSwgU2h5YW0gU3VuZGFyIFMgSyB3cm90ZToKPj4gQWRk
IEFNREkwMDE1IF9ISUQgZm9yIERlc2lnbndhcmUgSTNDIGRyaXZlciBzbyB0aGF0IHRoZSBkdy1p
M2MtbWFzdGVyCj4+IGRyaXZlciBjYW4gYmUgcHJvYmVkIG9uIEFNRCBwbGF0Zm9ybXMuCj4+Cj4+
IFNpZ25lZC1vZmYtYnk6IFNoeWFtIFN1bmRhciBTIEsgPFNoeWFtLXN1bmRhci5TLWtAYW1kLmNv
bT4KPj4gLS0tCj4+IMKgIGRyaXZlcnMvaTNjL21hc3Rlci9kdy1pM2MtbWFzdGVyLmMgfCA3ICsr
KysrKysKPj4gwqAgMSBmaWxlIGNoYW5nZWQsIDcgaW5zZXJ0aW9ucygrKQo+Pgo+PiBkaWZmIC0t
Z2l0IGEvZHJpdmVycy9pM2MvbWFzdGVyL2R3LWkzYy1tYXN0ZXIuYwo+PiBiL2RyaXZlcnMvaTNj
L21hc3Rlci9kdy1pM2MtbWFzdGVyLmMKPj4gaW5kZXggOGQ2OTQ2NzJjMTEwLi4xYTdjMzAwYjZk
NDUgMTAwNjQ0Cj4+IC0tLSBhL2RyaXZlcnMvaTNjL21hc3Rlci9kdy1pM2MtbWFzdGVyLmMKPj4g
KysrIGIvZHJpdmVycy9pM2MvbWFzdGVyL2R3LWkzYy1tYXN0ZXIuYwo+PiBAQCAtMTc0OCwxMiAr
MTc0OCwxOSBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IG9mX2RldmljZV9pZAo+PiBkd19pM2NfbWFz
dGVyX29mX21hdGNoW10gPSB7Cj4+IMKgIH07Cj4+IMKgIE1PRFVMRV9ERVZJQ0VfVEFCTEUob2Ys
IGR3X2kzY19tYXN0ZXJfb2ZfbWF0Y2gpOwo+PiDCoCArc3RhdGljIGNvbnN0IHN0cnVjdCBhY3Bp
X2RldmljZV9pZCBhbWRfaTNjX2RldmljZV9tYXRjaFtdID0gewo+PiArwqDCoMKgIHsgIkFNREkw
MDE1IiB9LAo+PiArwqDCoMKgIHsgfQo+PiArfTsKPj4gK01PRFVMRV9ERVZJQ0VfVEFCTEUoYWNw
aSwgYW1kX2kzY19kZXZpY2VfbWF0Y2gpOwo+PiArCj4+IMKgIHN0YXRpYyBzdHJ1Y3QgcGxhdGZv
cm1fZHJpdmVyIGR3X2kzY19kcml2ZXIgPSB7Cj4+IMKgwqDCoMKgwqAgLnByb2JlID0gZHdfaTNj
X3Byb2JlLAo+PiDCoMKgwqDCoMKgIC5yZW1vdmVfbmV3ID0gZHdfaTNjX3JlbW92ZSwKPj4gwqDC
oMKgwqDCoCAuZHJpdmVyID0gewo+PiDCoMKgwqDCoMKgwqDCoMKgwqAgLm5hbWUgPSAiZHctaTNj
LW1hc3RlciIsCj4+IMKgwqDCoMKgwqDCoMKgwqDCoCAub2ZfbWF0Y2hfdGFibGUgPSBkd19pM2Nf
bWFzdGVyX29mX21hdGNoLAo+PiArwqDCoMKgwqDCoMKgwqAgLmFjcGlfbWF0Y2hfdGFibGUgPSBh
bWRfaTNjX2RldmljZV9tYXRjaCwKPj4gwqDCoMKgwqDCoMKgwqDCoMKgIC5wbSA9ICZkd19pM2Nf
cG1fb3BzLAo+PiDCoMKgwqDCoMKgIH0sCj4+IMKgIH07Cj4gCj4gQW0gSSByaWdodCB0aGlzIGFu
ZCBwYXRjaCA1LzUgY2FuIGJlIGluZGVwZW5kZW50IGZyb20gcmVzdCBvZiB0aGUgc2VyaWVzPwoK
UmlnaHQuIDEvNSBhbmQgNS81IGNhbiBiZSBncm91cGVkLiBCdXQgcmVzdCBvZiB0aGUgb3RoZXIg
cGF0Y2hlcyBhcmUKZXF1YWxseSBpbXBvcnRhbnQgYmVjYXVzZSB0aGV5IGRyaXZlIHRoZSB1c2Vj
YXNlLgoKPiAKPiBUbyBtZSBpdCBsb29rcyB0aGVzZSB0d28gcGF0Y2hlcyBlbmFibGUgYnVzIGNv
bW11bmljYXRpb24gYW5kIHRodXMgYmUKPiB1c2VmdWwgd2l0aG91dCByZXN0IG9mIHRoZSBzZXJp
ZXMgd2hpbGUgbGF0dGVyIG5lZWQgbW9yZSBkaXNjdXNzaW9uCj4gKEknbGwgaGF2ZSBzb21lIG5v
dGVzIGNvbWluZykgYW5kIENjJ2luZyBsaW51eC1hY3BpLgoKSSBoYXZlIENjJ2VkIGxpbnV4LWFj
cGkgaW4gdGhpcyByZXZpc2lvbi4gRG8geW91IGhhdmUgYW55IGZlZWRiYWNrIGZvcgpwYXRjaGVz
IDItNCA/CgpUaGFua3MsClNoeWFtCgotLSAKbGludXgtaTNjIG1haWxpbmcgbGlzdApsaW51eC1p
M2NAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2xpbnV4LWkzYwo=
