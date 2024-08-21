Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE3B2C52D6F
	for <linux-i3c@archiver.kernel.org>; Wed, 21 Aug 2024 17:22:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:From:
	References:Cc:To:Subject:Date:Message-ID:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=Op4b/NkYPfGbT39T6h3ZoGqQgVTa/O4vwxk37YfAexY=; b=qYtMwZXxfYXZo2d5cMmy4gFMZT
	hdQ7sNkBxcTgGmMioEOkMQZPkD5UJzgVe9P6eLs4/51pDQwSS7RhBElZUtDFbxE7Ldr2/wdkRzuAZ
	R2Txi5Te+1jYG4kicYQ0RM2kE8na1mI0B9DQVyZPzBXvOb9ofX4ZczO0A2nNhRMDWwUBRG4I97BhD
	I9CAxK8rypNdnIWDChvhNmByCmS62gbJ2fDrIz8hKrOtU0TocfFWwlCxIlfc/uQ9zOld+LcnCZ/HJ
	5o0S1CxbaqQrCnXYDOItMbSkgCaeeL2UrjawtEGY5dvgoY0RDtGjL7kFkTxKG/0wQGw6OxKtELJPF
	zDLaKhWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sgp2N-00000009uJv-1nbI;
	Wed, 21 Aug 2024 17:22:23 +0000
Received: from mail-bn8nam12on20624.outbound.protection.outlook.com ([2a01:111:f403:2418::624] helo=NAM12-BN8-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sgp2K-00000009uIq-3QXv
	for linux-i3c@lists.infradead.org;
	Wed, 21 Aug 2024 17:22:22 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Fufc3RHDswG9ngngQqKXAGCUyshLktl/mNmlfODZLWZKBiHt+wA9E6EzUHsgYAWTXNpkHVtgYtxWWGazBX4LD2RKWKOwsDvykjbLmz+F53qH8svdTuzh9Qm4DjtvLTX/pnSzposkq2BxGVmyf+s0lh0fKigv5Pk6AfM1RE0Zj27buMV1Q1k5au6HXr+k/maDgG7J+Xlr7BTDidjwY6mDeV4RnQUZuAvWpv0E+vetdp3TBrm6ih/yNlXvjGHzpfIkSprSggDMQVXBGRK9qkwnrjzVDuzj4F2rS3Nyq3PIFJ9v2HJKHzU2dCtwiPIRusoFKSryWvlOv7FFubySiTN2Vw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yNTqTUfrOPMrT3aNtZnpCrfZCI07L4R8fwErDFitpYQ=;
 b=o8nwlFksWs2fbloTAgT6kNtWNZknnP3g1bFsmNBaC6JbSOjmjZHFwtYSmp9WfFTItnpzaaLkTK4MS/xdvWWxZ3GsEtTyOTHwId6PxXIuEImJrXVd4L/s/YK6Q+esSTK4o8ujr3ErYZwVeIdUypmkH4BfEhkDzT3Ogl7G/kYvKd2XO8JF8YUctHYCBjAFxu/3cIld78w0w+RcHLa6/mXYJFqSrCR+WaxMIhBzm91cvY1qZlBRwI59/1KTdyWFzipLVNbJU7skRgxb9Br312n/t6Ck9PXLHOzeJjST86TC+SPvC0n9NdocWw6ZXCfcN75uL/dhbt4fk1NFEJDyVBGdfw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yNTqTUfrOPMrT3aNtZnpCrfZCI07L4R8fwErDFitpYQ=;
 b=v/ftWOtWq/r9+Z25h0GMpqfoPHOZjsUBUkxx2czv1cC/KSBepCNhdVKhIfXJY395Gjm4NWxu6uIFoWuR3J0/+akhpHbHiTNy/KXcmtgEQCHC8nux6SKKv76cYx6Hu3JO21WYQr5CDPM2lpmda+x/AXwCF61nuYpZ2Yd9NVqWMw4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BL1PR12MB5176.namprd12.prod.outlook.com (2603:10b6:208:311::19)
 by CYYPR12MB8749.namprd12.prod.outlook.com (2603:10b6:930:c6::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.16; Wed, 21 Aug
 2024 17:22:16 +0000
Received: from BL1PR12MB5176.namprd12.prod.outlook.com
 ([fe80::ed5b:dd2f:995a:bcf4]) by BL1PR12MB5176.namprd12.prod.outlook.com
 ([fe80::ed5b:dd2f:995a:bcf4%4]) with mapi id 15.20.7897.014; Wed, 21 Aug 2024
 17:22:15 +0000
Message-ID: <a1393cc5-f409-4d0e-a4a1-5eed61c43ea3@amd.com>
Date: Wed, 21 Aug 2024 22:52:08 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/6] i3c: mipi-i3c-hci: Add AMDI5017 ACPI ID to the I3C
 Support List
Content-Language: en-US
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Jarkko Nikula <jarkko.nikula@linux.intel.com>,
 Guruvendra Punugupati <Guruvendra.Punugupati@amd.com>,
 Krishnamoorthi M <krishnamoorthi.m@amd.com>, linux-i3c@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20240821133554.391937-1-Shyam-sundar.S-k@amd.com>
 <20240821133554.391937-2-Shyam-sundar.S-k@amd.com>
 <9584ddb0-6e39-4d04-9242-a68eb4b86eba@amd.com>
 <ZsXyHfLJ8SJOW0RF@smile.fi.intel.com>
 <236aa6d9-bb5d-4854-86e3-5473f5ea6337@amd.com>
 <ZsYKGOLN3_2VU6Ld@smile.fi.intel.com> <ZsYK1P5nW5e1U1mJ@smile.fi.intel.com>
 <ZsYLKFCvLdMn5FM3@smile.fi.intel.com>
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
In-Reply-To: <ZsYLKFCvLdMn5FM3@smile.fi.intel.com>
X-ClientProxiedBy: PN2PR01CA0226.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:eb::9) To BL1PR12MB5176.namprd12.prod.outlook.com
 (2603:10b6:208:311::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR12MB5176:EE_|CYYPR12MB8749:EE_
X-MS-Office365-Filtering-Correlation-Id: 05199c2f-5c49-4e56-4443-08dcc205cd84
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?TE80YVpMWGlhSjMwQXFNSUtLZHUvZmt3bTg5YXVpYW9aYkhmZnJlRFlqTUxS?=
 =?utf-8?B?VmFUWW5mdTQrc1lWQnpYMEtDTVVZRTlJdXMwcmoyK0p0L0NVR2JOZTdYUms0?=
 =?utf-8?B?WjZvd1ZDdzcvNTl0dWtSNm1XZnBuQmhqUkdvL3habUdENzRkb04vbkdBSVdM?=
 =?utf-8?B?dW14L2Flc2RXNEQxTU9TZHdWRGJnbjkvcUlUQnFFWmljZ01SekhmeS9OTWJx?=
 =?utf-8?B?VExzZG9kUjVjQ1YxWXBvMWYrQkJYWkw1R0RpV1VPVE1jMUdzZjQ0UWxFcjhz?=
 =?utf-8?B?M2lnQUxZVTUzbGlZdEF2WDkyRW0vRGNFOG5pMTVoaWROUmIyc0JYb1RzVkNT?=
 =?utf-8?B?VmQvZmNITmZDcHVFRlNva0dSdVZCdEw2OStxQVE1SHJrRXBmUWVLTytQSk1w?=
 =?utf-8?B?b3grRG5vU2dwQk8yUWUwZHE2bkdxc2MvY1J6d01uek9kSVNxd2tpRnlKcE1P?=
 =?utf-8?B?SVNRY2dGMUFrN25Nc3F2TlIxZEdVQ0JQODFuZ2pWOVJ6K3NBNW1NUHJkQy9i?=
 =?utf-8?B?VVF3c0ZGNkUvVDNucVE5VTFuYnEwd0V3ZlpmTXJjSXoxcHpJaWhyS0gzUGZa?=
 =?utf-8?B?Z2ZNVGJISlV6N2RwNGZ4SnNiMlN4YS94S3hNalJwclhSRzM5YmVtZlErdFJw?=
 =?utf-8?B?a053VGxhTnFuTUZYTmR6Z244VGlNbmVRQmxpL1JIQnM2MGF0K1RtYnRnQ3Q5?=
 =?utf-8?B?NWxFM3JYM1YvMUY4TmNITkRLM3dzNWtTeXRmZ09NZkRBVzYvaGoxL3ZIUXBv?=
 =?utf-8?B?dklrcmZPOEV5OWNLSFR2NFFnSzJ6YmgrV2dHanFudG1VOFdla3NVYklyMEd1?=
 =?utf-8?B?eXJiMENEaktrelFBVG41N0diZmkzZnBsMDRMQ2FMcXllSXNVVWlSZVhVTXpN?=
 =?utf-8?B?Tm52Mm5GVWtSTi9TOE15WHh1UEVidXN4SlRTSUJYdlJkSXduMUczdUc5dHJa?=
 =?utf-8?B?TWU3NEtuSHJGandoL3REOTF1c2V5Q3hQaE9FUEJPeVZkMmtvV0pscTdQMno0?=
 =?utf-8?B?N3VTRWw0ZXRFd1NSV2Uza0hqZTc3bkNSY0FLSGRldnptaXY0UDlyenM4M3Vh?=
 =?utf-8?B?UUh1N3VqOTFsdzRRZmVvMzc0OGJzMVNLZTdUYUhWTWFhd3hOTmVxczdMT25K?=
 =?utf-8?B?SzBZaU9yRFRWamdLQlI0YjF6NHVhNCszTjFkN3p4bitROEpxbG1xSm11aTJa?=
 =?utf-8?B?Z2JORDc2c1JtM2w0ZzUzMXczRHlTUXFIV1NFRCtaL2d6NnN0YmU0U0NST2RM?=
 =?utf-8?B?b2EzakYyZ3lrWDZicDFTSDJwRlpCT0ZqbWMra3Zsa3g3NUJtd1JLZjgxbGJJ?=
 =?utf-8?B?SmpSK2hFZWh2Z2ppU2tab2ZiV2lLVi9jcmdHdkczTlFRSWdURXlidWlKWUp3?=
 =?utf-8?B?TTJhUUZVamdSUTVYY2YzUStSbDBUaVR4VFZLVXl6dUxyaTVBWFAxOE5qTWVL?=
 =?utf-8?B?MlpWU3dRZjloempXTW5CbExXZnBpMHY4amZGaDZXczV2ZUtUZ2VseWFvRy9x?=
 =?utf-8?B?a3U2ZTJSQ0h2Mk1FbHpURldDUUR6enR6amNEQUtiWG9LU0hsbjlsd25NNEgv?=
 =?utf-8?B?Vi9aYmIrMnM2WThTV2xFZUwrYUkyMUtodnlIbzA0QjJpaTE0YllNN0E0YWJF?=
 =?utf-8?B?QjI4bEo3VFFPbWdzVVhoWlF6STN0SVVMWWUzSG5Vb1NhL0Rwc2JPaFdaa09J?=
 =?utf-8?B?UTNsODlRMWw5NXRtNVFLVjhXK253ZXZMc3lQVWFtL0FyWGlNQkVUaW5Ndkdy?=
 =?utf-8?B?bkVlakQ0K0ZPaGNjSzNJUDYrTjJGWVdVVy9FV1pwV0I3aXJNVHREM2JaZ0Fo?=
 =?utf-8?B?VEZCSnhTMFVGWVdVVFBQZz09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR12MB5176.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WVJTZ3FSTWMwTVVUcTJva0RXSUkyc1JkWkhaVzl6V0V5K3puUXF2L2Q2UHI1?=
 =?utf-8?B?TXpibXpLSUNTaHJYcFBtOHBVR0hKMEtzajB5VG8rVHdPQWJ2VWt4amFsbFhq?=
 =?utf-8?B?akNLcDJoUkJlTFlUSk12LzVFRUZ1bmZFMXM4Qm5YUmkrWWVORzRPU2htYi8w?=
 =?utf-8?B?OS9JWnowZXllQUZWOWkvSnMzbytKbGtzUU9vWldIV25yT09helB4dWptdHlz?=
 =?utf-8?B?eVExRDErY1FEQjhSUWtvcUlMYVB1RDVtQWh6OXNOUFdXS204eHVUYmN5NlRs?=
 =?utf-8?B?YUFrQ2ZJWGd5TUhuZXZkU3dpb2p1YlV1d1lFRGxGUTA1Mjltbi9SNFplZDNu?=
 =?utf-8?B?V1hrVVRJaElUSUlVbUN3WlR6OWFmZUxpZkxFTkxhdThybXdFRjR3WWxZTHJt?=
 =?utf-8?B?dnR4OVZvSXU5a2ZxWnRRNkRiQzZyTE1rcDBFMG9zbk1xdVRSbzJGcStMMGcz?=
 =?utf-8?B?UnVSVXB5UVRoQWN0UGtKaVpGOTNLekNsOVUvYzI0cmMydlpiaWNta2h4Z2J6?=
 =?utf-8?B?ZktVKzZqTFJ0S2toeUlQbi94NFpOdzFxSFNNMGNTYVRuKzlsL3lJb1RwdUxK?=
 =?utf-8?B?Mk1vUnNmTFJGMGZRYk9KcWZQQ21IblhqY1pJL01mYTN1OUJOaVFEYS8yTU85?=
 =?utf-8?B?NEZFbTlZUHhRbGtRYjQvRVlBSjI3WVNyQkZ0T3RnWHhUbGFFbk5iN2xseFRV?=
 =?utf-8?B?R1dlQ0NqQW9PRStrUkZkMzJmVlcxKzIvSFkwTG9qcG1meWtCeS9kVk1IZ1pI?=
 =?utf-8?B?dEVyMG4xdyt0cHpQQUtjKzFSUGliZUpTVytuVHYyWFYyZ25BNXVlS0JXREd1?=
 =?utf-8?B?OFFGMmdQelM5R2lvSkRHRkpMazZnd2tjYmpjSXhweXlTM3hnYUVCcmNEeFhv?=
 =?utf-8?B?VUREeFJnbzZnU1ZMaEZRSDBFQmdoVjliMjhpVDlGUEJWalcwcDBJbkxJQU5U?=
 =?utf-8?B?WUtTaFFuTmdrYkFyME9TZ1B3NjMzTGNxK24xZWhQSjZaaHhPcE9wbk8vUCtU?=
 =?utf-8?B?WmEvZFc2MXNqTklSRjhZSWMxeG1FRDdWVW8vWFZMTGN0VGdJRmNwSm5hVXdx?=
 =?utf-8?B?aGFxSHFsWXJnSzY3TXFSbEdGUWNlTWgvZTJFVUFmOXFSbFUxaUc1VTEzZ1NZ?=
 =?utf-8?B?TDJ0WENIdW5LOTFycUluNTdYZDRQY1RNZ1BWcnNNZVFhZnZvNG56YXE2czdo?=
 =?utf-8?B?MmhKNkVhdVlZQWxGVFZuRXB3aUVreFU0eVdrdnBDVnYvbjRwSzFzV1gyZ25G?=
 =?utf-8?B?Q2VBdW00M1FQbk9IWGswUFNCb2hHZko3QWNwUzVRRzQ5Qkdtbm5BeHFqaDdL?=
 =?utf-8?B?REtzeHBHMnk0ZmRiaHgvYnEyd1lHZzdYNGRwUWhUODl2bDNXNkJmNGRFZXQx?=
 =?utf-8?B?bkVKbW1MUy94N3NzekZwaFNlTDVRR20zdHQrTjRkYjVUeDhpbzEwNXR4WDc4?=
 =?utf-8?B?dWYvR3VTaDU4NHRITTk5MHdvVGtsREIzaWUrZkRkMlBFaGVlRUhWWjRaRGxw?=
 =?utf-8?B?dTluc3FnVXNBZ0RrTGtPZzNlT3pjVWszVUxXMUtwNDV3bEl6L1JtMHBuSG1j?=
 =?utf-8?B?TWlQMCtYTUV6UWdJdVhqZnFBMXplNDZkK1FoYTJmN01aSUpJWE9Ic091cDFz?=
 =?utf-8?B?T2VPZnFlTFg4aDF5MFhVMmlidW1EanJ3Snh2TkcyMDROOVlxQTV0YjdVWG5s?=
 =?utf-8?B?aWxkOHVRT25hY2grL2phMWRBYmNKWkdYQU5mL2hISkVlYWMyR0NOUzRFSmMv?=
 =?utf-8?B?NXAwM0FMMW51bnlKblk2K3J6ZDBxeVltbVBmS0hXNEJZQ3Vqa3VOUVNMTmJ6?=
 =?utf-8?B?R3YzNVJGSVdFa3FOekRHWWczdndKaHBrNXhweU5PK2hycEc2ZVZHV05SbjBE?=
 =?utf-8?B?KzNBSjNUaEFicHRuTC9kU3o5VitTZndXUDFXK1Bkb25XWHRrdGZLMXY1ajR3?=
 =?utf-8?B?ZVQwZXRoZ2Q1UXVqc0dkLzV5OUJYNXJKNlJwdDJva2twd1NlVXk5VVppL01z?=
 =?utf-8?B?YUV6MS9FMDhWTXFadWF1QlVyMmtXU2FHTW1LRjlYRTJRcGRuWnd5NythUlYv?=
 =?utf-8?B?SlR1TldFZjdiV3dPVVNkRDkwMCtzOHl2NGhYdklWUG01LzVMWHZvRTQxQXp6?=
 =?utf-8?Q?SkiZRk9A8yoRzI/h3NXXJsY7y?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 05199c2f-5c49-4e56-4443-08dcc205cd84
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5176.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Aug 2024 17:22:15.9358
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: V/nE7x8UR4Bb+petO1llThtSkVjpSJOjVotVgdKkp0BtMfkLqtKix1yOKtntrrfMTlDs0R3gw/6OV8nIOZ+29g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYYPR12MB8749
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240821_102220_898435_BC14557A 
X-CRM114-Status: GOOD (  14.58  )
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



On 8/21/2024 21:13, Andy Shevchenko wrote:
> On Wed, Aug 21, 2024 at 06:42:13PM +0300, Andy Shevchenko wrote:
>> On Wed, Aug 21, 2024 at 06:39:04PM +0300, Andy Shevchenko wrote:
>>> On Wed, Aug 21, 2024 at 08:42:12PM +0530, Shyam Sundar S K wrote:
>>>> On 8/21/2024 19:26, Andy Shevchenko wrote:
>>>>> On Wed, Aug 21, 2024 at 07:07:45PM +0530, Shyam Sundar S K wrote:
>>>>>> On 8/21/2024 19:05, Shyam Sundar S K wrote:
> 
> ...
> 
>>>>>>> This update adds the AMDI5017 ACPI ID to the list of supported IDs.
>>>
>>> s/This update adds/Add/
>>>
>>>>> Please, provide a DSDT excerpt to show how it will look like in the ACPI
>>>>> tables.
>>>>
>>>>     Scope (_SB)
>>>>     {
>>>> 	...
>>>>
>>>>         Name (HCID, "AMDI5017")
>>>>         Device (I3CA)
>>>>         {
>>>>             Method (_HID, 0, Serialized)  // _HID: Hardware ID
>>>>             {
>>>>                 If ((I30M == Zero))
>>>>                 {
>>>>                     If (CondRefOf (HCIB))
>>>>                     {
>>>>                         Return (HCID) /* \_SB_.HCID */
>>>>                     }
>>>>                     Else
>>>>                     {
>>>>                         Return (I3ID) /* \_SB_.I3ID */
>>>
>>> Do I understand correctly that I3ID is the old one (as per another path I have
>>> seen last week or so), i.o.w. *not* a MIPI allocated one?
>>>
>>> If it's the case, feel free to add
>>> Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
>>> from ACPI ID perspective.
>>
>> Regarding MIPI ID and using it as a _CID is kinda unsolved now, in any case
>> _CID *requires* _HID to be present, and hence _HID has a priority in
>> enumeration. It doesn't matter if it's absent now (it's even more flexible in
> 
> Just to be crystal clear
> 
>  "It doesn't matter if _CID is absent now..."

Thanks! yeah, and that's right. I have left this decision to my BIOS
peers.

btw, I have notified MIPI about this error in the MIPI I3C DisCo
Specification.

Thanks,
Shyam

> 
>> case MIPI decides to use _another_ ID for _CID) as long as software uses
>> _HID for enumeration.
>>
>>>>                     }
>>>>                 }
>>>>                 Else
>>>>                 {
>>>>                     Return (I2ID) /* \_SB_.I2ID */
>>>>                 }
>>>>             }
>>>> 	
>>>> 	...
>>>>     }
> 

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
