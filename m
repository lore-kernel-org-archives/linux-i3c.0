Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A197C44501
	for <linux-i3c@archiver.kernel.org>; Thu,  9 Jul 2026 09:09:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QJs/8Cwl9kArS7HtGKsFedAKzn7T30no5EezO7ExOQw=; b=b1/NNyvoA7NbfK
	3as6fkkyH9SycNEWcjk1IoFh4uxeGlsTHAsNEyZfBHGyuI08/Mw6qb8Z0+Jy1MkxI2SO4LiwdHPs+
	UcxPPw0UsCEDGpK1u3JHVuFh7/aCgsZQSRtYnk7L/GtTTNYZujwmWUot5CLJmFq7/Quyg5qJmSHXl
	y61uTPAWP1FH1DwmuHj/iXVFNAz+E6iP5dPmPSDEwT8CS/mQhB+V/Q+Gs6LsifvYAIvQ/H9oI5OsQ
	5eZIqp0mXqG+Iasz/Nztylr8ZBPOsDtRcH1TFxtLlLk38xAH9xUuoBkHXONyt0u/ZvrW6LsIOI1zw
	MdsjqgDjppysGsc6X6uA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whklZ-00000001j8S-3am7;
	Thu, 09 Jul 2026 09:09:57 +0000
Received: from mail-westus3azlp170100009.outbound.protection.outlook.com ([2a01:111:f403:c107::9] helo=PH7PR06CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whklQ-00000001iyB-1bRz
	for linux-i3c@lists.infradead.org;
	Thu, 09 Jul 2026 09:09:50 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=W7q9QeJaQLo9uUbwnBgy6m2ZvtkW05TySxOAaYJzhLXyUzlFgb2Nm4SZ/dDdwMpmFBj6ihKjXC8XMfK4rFcPcGFgB8yDsKCDBWnXmDmnY9ZpAYx/Utyl/M+xx5e6WCzFHyVa8gt4IWCBrZmfiBSRN9ZpokxjiYS5s1MtBEeooH/DNX8xSjariOKh7F8tCW4S/ckmY5hZ1ejFtR7EKXgWoV7Un3YqboTqKBx2floUYh+G9y22olsDQSYoCjuPURtT6MNFnNNnSfA0TvCLjPmlkAdSlpDqEnihI8bwzgvWPTaXXHDtpzIZ9NbBRxdATTsjr3d8IpNI3Oujpk+QqcVCvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pCwwLHXc/0wqgCxnqzxXJM6v/dFSMsdQb7dO7iwdpAE=;
 b=sOUuG7NxBSpNIkmokSv8jCkONHcGA3sXauykXB6NNmaXnmq8xS8oBGVmH2lU/zojrCpHiyLjV/yM5NxTAoo3whlq2YD9o5zl80+kW739jnBFWt4Wc9rDdcaWgRWlcPfhe2ymA/FbIiXuFsFbinjRFKpnZiMGaFovkwgeZdFzc6hqycat2UsgZN3O3KRtjOkRCiMw+dYZpaMff7rVpzA0G64xSDtHAujd/6fYleoUZkHNoSA0wj/7Sm885lPgnmdZtrcRS5eALmpCBWlslm2zjoGVOyL3IfOtvmX2kYnQ9xjwL9h0nqL/UYAgVTAUY+dcqr9TmtArZn7R9caYzrkAjQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pCwwLHXc/0wqgCxnqzxXJM6v/dFSMsdQb7dO7iwdpAE=;
 b=ylQNAftHy0aBs8VHxkcnN2WZZZMl1Mf+Pi0gwQWfu0W3jwisqeQLGtgtfdDHvMkn2QpqpSZqMMvWt1tELyrEqdQznc4IWakoAjaGtNBCnDUWijuLIM4U++jekV4y+NX+ruJtL9+ViISPXXJj1MZCus1xNEWd0OdxXqhW8Yjyzfo=
Received: from LV5PR12MB9828.namprd12.prod.outlook.com (2603:10b6:408:304::19)
 by SJ2PR12MB8832.namprd12.prod.outlook.com (2603:10b6:a03:4d0::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.8; Thu, 9 Jul 2026
 09:09:42 +0000
Received: from LV5PR12MB9828.namprd12.prod.outlook.com
 ([fe80::f132:7e75:fd38:8685]) by LV5PR12MB9828.namprd12.prod.outlook.com
 ([fe80::f132:7e75:fd38:8685%5]) with mapi id 15.21.0181.009; Thu, 9 Jul 2026
 09:09:36 +0000
From: "Datta, Shubhrajyoti" <shubhrajyoti.datta@amd.com>
To: "NG, TZE YEE" <tze.yee.ng@altera.com>, "Guntupalli, Manikanta"
	<manikanta.guntupalli@amd.com>
CC: "linux-i3c@lists.infradead.org" <linux-i3c@lists.infradead.org>,
	"Frank.Li@kernel.org" <Frank.Li@kernel.org>, Frank Li <Frank.li@oss.nxp.com>,
	"Goud, Srinivas" <srinivas.goud@amd.com>, "S-k, Shyam-sundar"
	<Shyam-sundar.S-k@amd.com>
Subject: RE: RE: RE: [PATCH] i3c: master: dw-i3c-master: fix OD timing for
 first broadcast
Thread-Topic: RE: RE: [PATCH] i3c: master: dw-i3c-master: fix OD timing for
 first broadcast
Thread-Index: AQHc+LEtZd2DpZcCgEm4F8t9yIwuN7Y3dzOAgAIUOgCAAQW1gIALBfKAgAfAwvCACvCcgIAANbCwgAxsrgCAACYHQIAAAmaA
Date: Thu, 9 Jul 2026 09:09:36 +0000
Message-ID: <LV5PR12MB98286D643E990DDDA63B8CAC81FE2@LV5PR12MB9828.namprd12.prod.outlook.com>
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
In-Reply-To: <LV5PR12MB9828AC9C97DA5FA9C82993F781FE2@LV5PR12MB9828.namprd12.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_198e8dea-a4f3-4850-b16a-fd6d2b1302b4_Enabled=True;MSIP_Label_198e8dea-a4f3-4850-b16a-fd6d2b1302b4_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;MSIP_Label_198e8dea-a4f3-4850-b16a-fd6d2b1302b4_SetDate=2026-07-09T08:58:29.0000000Z;MSIP_Label_198e8dea-a4f3-4850-b16a-fd6d2b1302b4_Name=AMD
 General
 v26;MSIP_Label_198e8dea-a4f3-4850-b16a-fd6d2b1302b4_ContentBits=3;MSIP_Label_198e8dea-a4f3-4850-b16a-fd6d2b1302b4_Method=Standard
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LV5PR12MB9828:EE_|SJ2PR12MB8832:EE_
x-ms-office365-filtering-correlation-id: e4112e4a-a809-47da-7ff7-08dedd99cc7d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|23010399003|376014|366016|1800799024|38070700021|11063799006|56012099006|4143699003|22082099003|18002099003;
x-microsoft-antispam-message-info: TTwLUk8UMCW7NJcV9oCIHMvoJvtt48rQNga2bya9NNBKJNt1vW0QWiaNtF9kutdFJstWjHbZ9/rTxaSzdtg4pFwKrxv1jZfbl8VvrvkYfJ2zJX9r3RU2CkmyvuwDYZ8SscNvNO8ZrxVv1AvFlGG51BuL0LxkeDhoksPkEx1eeW6VicgzjQouX2CPl6CX39egPoAPlMIsK+CNwhdctyuplDCz5O3Ou2Y6iAW5j4CUJacXixlcTAnF7ClTJ9VJRJU8AJLz0RbbQRXfaaW+/8Y7jpcsKARkiQouz2qpe8KJHpqKttITrY2Oy6DcjA8aPUJwR1+N6jB7pMtrGN9Y67ExvlQJiANHOZQqHDQm7cfVAv2y6QLzgi879Woz2TLqSZIv/i6kxh3QISKCbFwuxgeDPCMAvw/xusOPaV8RtDX5ri7HhBcbtM7IcRqkqmeyaBjCfjlPprhCq575cLMU9THDZ/BHQFTfHUGj0SKwlJJL1/zBFztoEpTRvt4Spi94ivOf2zCDY9svHJyWpSSlOOmmR+IPEGvnu/5rdMqfETGjVzqd/yeF/eyfW0ZfpTln4oYtavXIyHwIryCn24P3uBKoUao2lVbXOuIE0sRAHDnpylLa0kFKe4yqygskJ+v7/e+CRQnAsV7HhaLkrEpQtGpL5tKH06kQEtRVz1/hzDjueS8Nsfm49miyLCgfkDqHfIG41YBynGDW0TowxxPDv5bJ/c4wYRFKW/GT2H9K22DSG7s=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV5PR12MB9828.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(366016)(1800799024)(38070700021)(11063799006)(56012099006)(4143699003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?YTJEZU5zS3F1Y1dLVWdMS3l1NXFFcXlOOGJGcUEwd2k2K0tiYWpVZ3NLQmlk?=
 =?utf-8?B?bHJmOS9ERE01U1A2aTE2MUR2NVNEOHhDRUQ0SnFvVEN0enU0bjNBTW1JZnlL?=
 =?utf-8?B?NVIxTSs2NXpnd2ZvcEtRdW9ZbVIzb1gwaWNQR0ZvNFZZdytId3ArcThFQUdm?=
 =?utf-8?B?MGlMYlpUSVRIcWRpalc1QTVKdTdiSE5BV2RMbnlZNnp3NUR3ZGgvR2tyS2Rv?=
 =?utf-8?B?dDJrV1hyRXNXbnpVdjZhQzBuNW8yVXQzdlJlL0ZFWHVIL2Z5bFFvWGE5OVFw?=
 =?utf-8?B?T2NlaXp4T1lKSm5HWHpidGpFcnBaNlY0ZjBHYzJIZm1DNnhJUitzQ1Z4VHVC?=
 =?utf-8?B?ZytvbXBlZktTZGRIWml3bmNicVdxTG9URVVqV3Y3aVVwSXMyc3FkQ1dWaHRk?=
 =?utf-8?B?QlRNVDJwcWNWRDBkL2x3WWxMbkNlUDlpamd2aEpwVzM3Z3FKWVJKVFpmVDcw?=
 =?utf-8?B?Z09TdlkzbkJKZ3dMdHZpaUxGR2RHZytoK09DRlJiWGNkMFlBY0ZBeVNPVmU2?=
 =?utf-8?B?Z2NEaERSYWdTWVhXcmpKZStZYlc4WGhWb3BTUXdNSDh2b0Y5K3l6MHJiejJT?=
 =?utf-8?B?SVBpVWtrVUlaTm13SWQwVytjYTNHdElha1BROTg0Y25sSEYxT2o0WEVzb2tW?=
 =?utf-8?B?Wmh0di92RTBJSmR4TGFtdkRTbnBxWUp5K1orVW5wL1BWYjZvQi9mTXA4TUtp?=
 =?utf-8?B?MFBJMWtlNWpSOEJvamVweGxVSjRTcW55RzNRalBXQm1vTi9lb2NUMHN5M1FX?=
 =?utf-8?B?TmNDSDNBOVg2dDlnVnNnT2YreWhOSVBmRkl5ODF6U29Kc3JJa2tyUUVxK0Jj?=
 =?utf-8?B?TDZRMmIxRWJuV2lFUjdPUi9PbUZQWWVQUFpvZjF6SmtiNEpLQXI4TVgrU2E0?=
 =?utf-8?B?SldLSEFDZzdhcU1oT2lmb2RTYzBVVjNaYVlBbUJ5d25lSEhjVjBPVjN6dFM3?=
 =?utf-8?B?S1pieno5UmFSbmdRdkdoS0VzdlIvOTBqaTlCaWxZYWM4OWxZalhBWGdhU3l1?=
 =?utf-8?B?eFcxRHQwdUluMmlRU3h3NW5WN2toL2xnYXZaUFFwRDdjTnp3RXpibyt6TUhk?=
 =?utf-8?B?VVZjWVkwaWMxOXBOT2hRcUZhcklHa2dvRmZBWmFOY0c0V1RJNnliSUdER3N5?=
 =?utf-8?B?YU05VzdhY0R2cy9vdWFLS3plT20yMDJzeUhvZzRJTzlldUgvVlQ1TWdpZUd1?=
 =?utf-8?B?cU55d3Q5MWd1OWMrc3Y0UFhBL1VGWG15aEhFQXdzeTFQaGhCQTV0b1VFdnVU?=
 =?utf-8?B?Q1FBVm9vYXJMZUhZeFRMMCt0ZHpCQnhZWFU4S1R2aTYvSGxubHVCbjBuUEMr?=
 =?utf-8?B?RHRhVU85OUowVW5mNzVNV0xsZjQwaC9kbW8xMFU1WDRKVjlMZlFTUUtVbU9R?=
 =?utf-8?B?QVo5Si93YVZYRzYyWDhQa25xZXFhWC8xK2JoZEFpZ3VnbHhQS2pIZVUxOFNm?=
 =?utf-8?B?WVk2bmtTeVplWkhpOWwwWERrUmdyMzRDRWNWd2FCSzgyK29NT3NDZ1NzSTZM?=
 =?utf-8?B?MEVSeEY5NTcxUVQ5clRmV01Hamp6Nk1hOXJDTlZBYWlrc05XZU9KTTZDaWhU?=
 =?utf-8?B?eUdzVGNCQUo0bVZhSEpLNndIM1hhRDRkUEUwWDVoOGV2VG5UV3NuZG5RZEhJ?=
 =?utf-8?B?RTBER1F0YkJHSVFuVkduak1aTXA2ODQ1b1d4RWlLOUwrb3hvRzFaMThDSWk5?=
 =?utf-8?B?VytrOXE4QmovS2FXb0MyZXVOZzRpNU9XckRSamR1c1EyWGhOdjNRQ0gzWGJR?=
 =?utf-8?B?THZCRmZUVHcwSDZaUWJzWVFmcXBnNDlmMW9uc2RkeWdJbUFSMHE1M0xyMnhE?=
 =?utf-8?B?L3FCRmpPd2M3UWtaTW9zRmNLblZsMmtxV1ZZUGllWEtHK0RvclJFVTlSaHZB?=
 =?utf-8?B?cXlKN0l3ZzNRQ3d6QTNiUnUwNG5GbTBTY2lKSmE3ZEd6STBlcUNvYUN5eVds?=
 =?utf-8?B?d01sTGZUYys1Q1QzNnFrSDBFSTNZYllydThmSG9TdnU1aFJuV2lEVVJUYkw3?=
 =?utf-8?B?Zk5DQWxQUjNmdElMQ2M3UEEyMlBqQ1pTSW5sNEpjUVlyUjlscTVrbHVGNDZt?=
 =?utf-8?B?TXVrQWxueFRzV3NaY094VlNSRmJjaWpsM1gvZEkrMmtpVVg5RUNzR2l5c0Fq?=
 =?utf-8?B?bGlsR1dEWGRUV3h1eEhCR2NvRHdsRGZRYllLYWJ0UHd6d05TL01GZ292eGVi?=
 =?utf-8?B?b3Z0c2FnWE0rL0d5THY5SzJqVFJwY2JaUC9BMlBpbGxydmp1ZGdLMTd2Zno0?=
 =?utf-8?B?SXcyMVhOMWFQUS9EazJIdUk5QmJhVGp5czUrRnhDSWxWcEt5WlBoWldzekRX?=
 =?utf-8?Q?o0S0bXgXMQKFcbkOQL?=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: LV5PR12MB9828.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e4112e4a-a809-47da-7ff7-08dedd99cc7d
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Jul 2026 09:09:36.3186
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Wu2/XRYbyk1mCxkDpWb8WYxUQBWF3DebKPv331YV2dQ4hJLGjbsYfB1jiTDzQkORQaMHsgXXsAujpFA06Hs4ig==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB8832
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260709_020948_428915_516B1C25 
X-CRM114-Status: GOOD (  16.08  )
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

AMD General

> -----Original Message-----
> From: Datta, Shubhrajyoti
> Sent: Thursday, July 9, 2026 2:30 PM
> To: 'NG, TZE YEE' <tze.yee.ng@altera.com>; Guntupalli, Manikanta
> <manikanta.guntupalli@amd.com>
> Cc: linux-i3c@lists.infradead.org; Frank.Li@kernel.org; Frank Li
> <Frank.li@oss.nxp.com>; Goud, Srinivas <srinivas.goud@amd.com>
> Subject: RE: RE: RE: [PATCH] i3c: master: dw-i3c-master: fix OD timing for first
> broadcast
>
>
>
> > -----Original Message-----
> > From: NG, TZE YEE <tze.yee.ng@altera.com>
> > Sent: Thursday, July 9, 2026 12:12 PM
> > To: Guntupalli, Manikanta <manikanta.guntupalli@amd.com>; Datta,
> > Shubhrajyoti <shubhrajyoti.datta@amd.com>
> > Cc: linux-i3c@lists.infradead.org; Frank.Li@kernel.org; Frank Li
> > <Frank.li@oss.nxp.com>; Goud, Srinivas <srinivas.goud@amd.com>
> > Subject: Re: RE: RE: [PATCH] i3c: master: dw-i3c-master: fix OD timing
> > for first broadcast
> >
> > [You don't often get email from tze.yee.ng@altera.com. Learn why this
> > is important at https://aka.ms/LearnAboutSenderIdentification ]
> >
> > Caution: This message originated from an External Source. Use proper
> > caution when opening attachments, clicking links, or responding.
> >
> >
> > On 1/7/2026 5:06 pm, Guntupalli, Manikanta wrote:
> > > Public
> > >
> > > Hi,
> > >
> > > Adding the below contact:
> > > +@Datta, Shubhrajyoti
> > >
> > > Thanks,
> > > Manikanta
> > >
> >
> > Hi Manikanta, Datta,
> >
> > Gentle follow-up on the AMD AMDI0015 quirk question below. It has been
> > about a week since Datta was brought into the thread, and I have not
> > received guidance yet on how ->set_speed() and send_ccc_cmd() should
> > interact with AMD_I3C_OD_PP_TIMING.
>
> Will check this and get back.
This quirk is added for the AMD legacy platform
https://lore.kernel.org/all/20241114110239.660551-3-Shyam-sundar.S-k@amd.com/

added shyam .
-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
