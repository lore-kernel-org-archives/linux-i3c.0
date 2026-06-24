Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F632CDB470
	for <linux-i3c@archiver.kernel.org>; Wed, 24 Jun 2026 06:07:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xF2md7qDS9+2hdwwJgTVVulqLsWvpsfWkN77CIrWg3I=; b=cNLqO7hUHZsAGE
	2a7GWEn9/CsDToMz2KNlZU9Xe8581CSMS26Xi8sJVLLLAe3LSvdYOb82t0fPw1Z8qrMVUZexMUWih
	VYPz0aQrZLt48JZgcsqAxszqL3wrw5YJpAr/nmpJYZKdII5lYRBpFsQFWo7rECS0kP3G8KQircQOh
	GLbx3gJArQjuaTeSaaage/+GHaVUAGPMKJ44uPNzAo/NNVQ5t+0mjfzhpAgHvHH4PcK3CsUuDBEMq
	FJDr0re44Bt/Qj7iPxQn93rzC0AqExG3K+rmic05JEXSp01qg2NAPYOlHV3w5eFTeCRRqJrVDGLyD
	Ayxui9xkwE2YDZIwOmFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcGlI-00000007CwI-2ori;
	Wed, 24 Jun 2026 06:07:00 +0000
Received: from mail-southcentralusazon11011014.outbound.protection.outlook.com ([40.93.194.14] helo=SN4PR0501CU005.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcGlC-00000007CvQ-2n2L
	for linux-i3c@lists.infradead.org;
	Wed, 24 Jun 2026 06:06:58 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=e2pDE2e5zpv7LP3Gmlj6v0sREOEi/7d/4sZg4d4vvnqrWNuWRkCoQCVjQtVP4carSKIAkmhk47iXarvn1dd9lC3x6b60LKSJJW/HZcH2s1hY3SsO3rEDABweE0eIg65rNDSOUwVHJandDhqUPSZa5NjYUJ9fgatW4+8KUyCqiDsTU3/IJ7y9ck1pmQ0VWBGMVLCDMs3WVUbnzAyBzwWVYZK6vWBxJb7vLpYi/HfQDMd0n6acAsAN15XJnXM6UogKNqayPE3SBs75ZlyP6gNv224E8003sbDkV6/tnPTOb9Btq0uIMpm9hdqxxyDMqTLX79Q+KATy/EC+FtXowyqnpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bNkds32mzkiFWWgIYaeCV04tQ0Z+PZ4MCX03nSpfIOA=;
 b=qQsi/mynooqvJnbvVUUQAuHZUTZXO1d1q9E6QCrKJloN1pnBylGcTHYocQuwqKHkvlISlKApNNv2c5YBNZUNqwtnf5PUp/fvofU/kk+z9RGtRb2kXVKhOUyQS/NktIb0jFcWHH1M9K6o8NXn1CyDvyOaMh0jMWKbVUrGYdUHIx9VspIwg66wNZfDfs3GN4wf1NL98xZTBK0yygZ8fwAVeQ71tT6j2Qs6evwrTnb6fJ8JhEIuDBF+48bZepJ5DrqLkYvuGOd5WBB0/hcmPlQPghRpankg+kICowRVklFjRSjeqUDqV6efcA+fCY4+DGlbzScrQEOeQNZDxMNp5VrpDA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bNkds32mzkiFWWgIYaeCV04tQ0Z+PZ4MCX03nSpfIOA=;
 b=YB1nodWhejpIOVutrRX1ldopZM56lpnbA+NHnwdpicFgCBA3G6xKwTz3oIqYvEORk0xGwQ8mhgLLbbl8/2KdiWy67Cp33CN1dMrysfqEV/Ng3OsSJ6kMvnVKZvMSfbXQxQsjHPqxaS31S+707y/3VSsFBd4nN0cLOJyvnyX8j8c=
Received: from CY8PR12MB7611.namprd12.prod.outlook.com (2603:10b6:930:9b::19)
 by CH0PR12MB8462.namprd12.prod.outlook.com (2603:10b6:610:190::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.14; Wed, 24 Jun
 2026 06:06:38 +0000
Received: from CY8PR12MB7611.namprd12.prod.outlook.com
 ([fe80::8668:174:2fcf:2bfa]) by CY8PR12MB7611.namprd12.prod.outlook.com
 ([fe80::8668:174:2fcf:2bfa%5]) with mapi id 15.21.0139.018; Wed, 24 Jun 2026
 06:06:38 +0000
From: "Guntupalli, Manikanta" <manikanta.guntupalli@amd.com>
To: "Patil, Shubham Sanjay" <ShubhamSanjay.Patil@amd.com>, "git (AMD-Xilinx)"
	<git@amd.com>, "Simek, Michal" <michal.simek@amd.com>,
	"alexandre.belloni@bootlin.com" <alexandre.belloni@bootlin.com>,
	"Frank.Li@nxp.com" <Frank.Li@nxp.com>, "robh@kernel.org" <robh@kernel.org>,
	"krzk+dt@kernel.org" <krzk+dt@kernel.org>, "conor+dt@kernel.org"
	<conor+dt@kernel.org>, "pgaj@cadence.com" <pgaj@cadence.com>,
	"wsa+renesas@sang-engineering.com" <wsa+renesas@sang-engineering.com>,
	"tommaso.merciai.xr@bp.renesas.com" <tommaso.merciai.xr@bp.renesas.com>,
	"arnd@arndb.de" <arnd@arndb.de>, "quic_msavaliy@quicinc.com"
	<quic_msavaliy@quicinc.com>, "S-k, Shyam-sundar" <Shyam-sundar.S-k@amd.com>,
	"sakari.ailus@linux.intel.com" <sakari.ailus@linux.intel.com>,
	"billy_tsai@aspeedtech.com" <billy_tsai@aspeedtech.com>, "kees@kernel.org"
	<kees@kernel.org>, "gustavoars@kernel.org" <gustavoars@kernel.org>,
	"jarkko.nikula@linux.intel.com" <jarkko.nikula@linux.intel.com>,
	"jorge.marques@analog.com" <jorge.marques@analog.com>,
	"linux-i3c@lists.infradead.org" <linux-i3c@lists.infradead.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-arch@vger.kernel.org" <linux-arch@vger.kernel.org>,
	"linux-hardening@vger.kernel.org" <linux-hardening@vger.kernel.org>
CC: "Pandey, Radhey Shyam" <radhey.shyam.pandey@amd.com>, "Goud, Srinivas"
	<srinivas.goud@amd.com>, "Datta, Shubhrajyoti" <shubhrajyoti.datta@amd.com>,
	"Patil, Shubham Sanjay" <ShubhamSanjay.Patil@amd.com>
Subject: RE: [PATCH v9 2/2] i3c: master: Add driver for AMD AXI I3C master
 controller
Thread-Topic: [PATCH v9 2/2] i3c: master: Add driver for AMD AXI I3C master
 controller
Thread-Index: AQHdAwXfb4OUCigf+UGGelBSnjNMkLZNN2cA
Date: Wed, 24 Jun 2026 06:06:38 +0000
Message-ID: <CY8PR12MB7611ED17F901F10DE84B39C48CED2@CY8PR12MB7611.namprd12.prod.outlook.com>
References: <20260623114417.2578189-1-shubhamsanjay.patil@amd.com>
 <20260623114417.2578189-3-shubhamsanjay.patil@amd.com>
In-Reply-To: <20260623114417.2578189-3-shubhamsanjay.patil@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_198e8dea-a4f3-4850-b16a-fd6d2b1302b4_Enabled=True;MSIP_Label_198e8dea-a4f3-4850-b16a-fd6d2b1302b4_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;MSIP_Label_198e8dea-a4f3-4850-b16a-fd6d2b1302b4_SetDate=2026-06-24T06:00:14.0000000Z;MSIP_Label_198e8dea-a4f3-4850-b16a-fd6d2b1302b4_Name=AMD
 General
 v26;MSIP_Label_198e8dea-a4f3-4850-b16a-fd6d2b1302b4_ContentBits=3;MSIP_Label_198e8dea-a4f3-4850-b16a-fd6d2b1302b4_Method=Standard
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY8PR12MB7611:EE_|CH0PR12MB8462:EE_
x-ms-office365-filtering-correlation-id: ae836e8a-5528-4dc4-bc76-08ded1b6c0f8
x-ld-processed: 3dd8961f-e488-4e60-8e11-a82d994e183d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|23010399003|376014|7416014|366016|18002099003|56012099006|11063799006|6133799003|22082099003|3023799007|4143699003|921020|38070700021;
x-microsoft-antispam-message-info: qsQgQfI8Ffe3n0/whcvv8qfmfMVpYG9IK53ZhTdduCqh7t2rhB0qWaVMV/Z+vxGjyX30HfEmvF7s5cjmObHVENorqsEBOObYPPMl6DJTyh2//WhqG43gsXQlryLrAf8pj9MSUKBtOo4T4Oqer3iednININUiiQUR7j6q8/Wp1wPxPFwrZP5AGmP+KXQAuYtUdlqwLnW2qK8Ph7cjDRAkt5XkPsx3+NN3PszGXKZMI12p/aHZgHwVutAtN/s5S1tQZVtgUCcnI5bl5GAlZtxrjByaOBYz6hUTK9c7SI8JZmZT45SDUgOMcFnypzo6P6AR4ebIX8ZxROhuRRY4ArFEzCZ/4P7OrhkQTLuwHUtUyYF9FvdZjnbhw1TMnIil4W+kANMrri6AIw8Dg75fdBxRUHu8nFzxDLtudid35Jgo68aSCnIt31SCdmPi1UseacHg2z9Vb5cwcnsiLK4WFJ8m65htY5oHD1M5SQsIZHEJkV0lruCq/ebZgtOgpvv0KrEXwZpD/cK6YCABkiwx89855Kjx/RQoHWE9E2C4i9laTYsXjzh78KFYU5IEx2y1MCbpPtm2R3xCD/OxTKrctQHFHeUByb5xC23P9LMFHlDkGxx+qmzO7en86CFi4uk8sO9jsw6PscCQ4avPFebwb9QiLasiZCVocRBs/U18qEfpkhRJKuia0azXFDrY4ctvszUicHpmjHV9oqBV9HPIL1Cw+sUf3PkizP+ocN/M7yQCT9bKY1uy2p9DrxZb1nYOwaTp
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY8PR12MB7611.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(376014)(7416014)(366016)(18002099003)(56012099006)(11063799006)(6133799003)(22082099003)(3023799007)(4143699003)(921020)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?S0UfH3XRoKmVVoBR47/KmQSAUfmLIZmXBu6aZz/IXQxTlOaCblr5n32RSfcO?=
 =?us-ascii?Q?mZBsx+fpoE6RvVpzDtY/pd8ZRzcWRLvb+K90b6zQH063FiQAe0G2l0xBqxNb?=
 =?us-ascii?Q?sx8voxPnz7WO7o2RA75NjUoC7nOwCclVJ79PNvu4dVmeZdwZeQdQMWHblOZ+?=
 =?us-ascii?Q?hr21i2ptNp235W5u3YMKBY/Lng/dom9XjoZh8QIuBMhD20L7KQQ5WoEEuWu3?=
 =?us-ascii?Q?TSje8cFY+0ChAsvAdWO5SMOj1HjHXVId1Tm6XB4Ac2+Rvn1wHCYxjrvAvtWz?=
 =?us-ascii?Q?E9hs8NRRfFHVPqLhpkePsbLJw4Xm2szrTykNguTMDgeD5oibRij1MGYkhf4/?=
 =?us-ascii?Q?8C4mzL+o2xV98yD9i7sx3RHWh1O6UR4qWeh2xea8AtRSSaETrhRygYeEPNOP?=
 =?us-ascii?Q?co29TM8XHE4Sn5b09vVBF6RdpzNaNGGmSzDRK2seTgj9pmhe3293+lOQ9OcW?=
 =?us-ascii?Q?KtcMNViqj+6xKqfG+YoE1+pa+1lVh8/W8gelEIXySG6cCMpAFhyiRA+7oXOj?=
 =?us-ascii?Q?jpeP9M14CbwNFk/xjp0iIUvclLCg5hfTUHNU+IJJoqGDRPyfyTdTh6nez7C+?=
 =?us-ascii?Q?1+XuPYnvSZ43sFmYc/vJ2c9KvVPaZFl2bWyaq2V+Ekapwh/FpM8NtNsXnrq8?=
 =?us-ascii?Q?mOPd5agtFAMk9Ei1eXxJytIrdtl8BV2/WQJZtHgc540gbOt51Hh+gIg/dZvU?=
 =?us-ascii?Q?Nb90TTCFPDU4l9eCDHdeDc+ZNJi2RppaAXI15+VB9qnmTFmkFrKF1XgIdHB6?=
 =?us-ascii?Q?20O89lDQY4bbncN1Icx4cVjhd0EzjrT12fi/DeXlKYdTPGpMmDWYH+UjNZJl?=
 =?us-ascii?Q?jcf0ZJYaFKRUN2D3PzjkFyanWljlT5Hs6a5dY3pe//6vAGRWc0wTYR7hcAaS?=
 =?us-ascii?Q?/6wKdG7r+uHtKNRTdP0yX9nsBxJOeEDcVXuiCJpX+EzCouYQXPTg3s5p01Nl?=
 =?us-ascii?Q?RVx6HPIzle2hjPw0oxzyfbHuIOmIrSSFxyiGfiAAKNqO6TrDVzUROLRwNXYe?=
 =?us-ascii?Q?nzZwxxgMdxvz4HXjMgUv7w7tD8Ko4dQE5pV7zY7kec+Yv9CoVm5WOepJlvC8?=
 =?us-ascii?Q?UfmdImfTajVDy8kIo4Q7tCSoMLj5ZQl7EG8oY5ClN+GMLm7k6ZJmfmSAhtgD?=
 =?us-ascii?Q?qwx67b7wALab2+O0ByQldei29HrNTrJ0qyG0MImIECLfWu1rAjCzfOFMyl08?=
 =?us-ascii?Q?hVpktEOVRdQosZYR/IJgD4cCirz00YPbqhTAvDefo2gcw0fVou/0qtw9izll?=
 =?us-ascii?Q?KQUeztLUh8xKNcodpOgyU7SA3RIfHUArUwF2dkb956UFyZZ6l6U+Rs0qjuVc?=
 =?us-ascii?Q?T/zrjqRBPUJd+T6ECvw6mQAxXC9OyKVvVUAAvwDW/eTWG4WLNlashF2zmmzh?=
 =?us-ascii?Q?tLPwAwFV9oqYQX95c6+3iw8l0gf1LIrpc01L6iQnCQB/RBHqWHd8EGHqbSKg?=
 =?us-ascii?Q?wx+BZRqVUzI8a9EoLPAvpg2y210uk7nA6lGc/9lP2YdWGq7zVrNSg7jtKFvS?=
 =?us-ascii?Q?mFhccjKTorwxMshXUvbNJiVLZAmJIimjGoDhprl7tWWkYOhgt8tB6xD1yAq4?=
 =?us-ascii?Q?3IsX/dAj8S3kxQl6eZuvJq2v3uguIO9ja0v9XfkuKH1v6ajO1SzXOkUiidY/?=
 =?us-ascii?Q?vwkfO6zVOdQrFmoU+4VgfU+ORexozNnAPVq3c4Fqfh8wJmih2uW9Yx2sLGyg?=
 =?us-ascii?Q?0love0r9IT8iEOF/qMUdVqFluVzZWbANt+13DC28tm+qDhq9?=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY8PR12MB7611.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ae836e8a-5528-4dc4-bc76-08ded1b6c0f8
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Jun 2026 06:06:38.4396
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: TMdk+UTBjoIUTPkN2KpfcGLpywTTsNv93wYpHiOFY9EVIDjnG3s4INSUvpDxTdiQRYKajAONcFI5Ft1U1AwSWw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR12MB8462
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260623_230655_096244_33517D52 
X-CRM114-Status: GOOD (  22.33  )
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

Hi,

> -----Original Message-----
> From: Shubham Patil <shubhamsanjay.patil@amd.com>
> Sent: Tuesday, June 23, 2026 5:14 PM
> To: git (AMD-Xilinx) <git@amd.com>; Simek, Michal <michal.simek@amd.com>;
> alexandre.belloni@bootlin.com; Frank.Li@nxp.com; robh@kernel.org;
> krzk+dt@kernel.org; conor+dt@kernel.org; pgaj@cadence.com;
> wsa+renesas@sang-engineering.com; tommaso.merciai.xr@bp.renesas.com;
> arnd@arndb.de; quic_msavaliy@quicinc.com; S-k, Shyam-sundar <Shyam-
> sundar.S-k@amd.com>; sakari.ailus@linux.intel.com; billy_tsai@aspeedtech.com;
> kees@kernel.org; gustavoars@kernel.org; jarkko.nikula@linux.intel.com;
> jorge.marques@analog.com; linux-i3c@lists.infradead.org;
> devicetree@vger.kernel.org; linux-kernel@vger.kernel.org; linux-
> arch@vger.kernel.org; linux-hardening@vger.kernel.org
> Cc: Pandey, Radhey Shyam <radhey.shyam.pandey@amd.com>; Goud, Srinivas
> <srinivas.goud@amd.com>; Datta, Shubhrajyoti <shubhrajyoti.datta@amd.com>;
> Patil, Shubham Sanjay <ShubhamSanjay.Patil@amd.com>; Guntupalli, Manikanta
> <manikanta.guntupalli@amd.com>
> Subject: [PATCH v9 2/2] i3c: master: Add driver for AMD AXI I3C master controller
>
> From: Manikanta Guntupalli <manikanta.guntupalli@amd.com>
>
> Add an I3C master driver and maintainers fragment for the AMD I3C bus controller.
>
> The driver currently supports the I3C bus operating in SDR mode, with features
> including Dynamic Address Assignment, private data transfers, and CCC transfers in
> both broadcast and direct modes. It also supports operation in I2C mode.
>
> The controller's data FIFOs are accessed big-endian; the driver performs this
> conversion locally using ioread32be()/iowrite32be() with the helpers, so it does not
> depend on any core FIFO-endianness helpers.
>
> Signed-off-by: Manikanta Guntupalli <manikanta.guntupalli@amd.com>
> Co-developed-by: Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>
> Signed-off-by: Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>
> Co-developed-by: Shubham Patil <shubhamsanjay.patil@amd.com>
> Signed-off-by: Shubham Patil <shubhamsanjay.patil@amd.com>
> ---
> Changes for V9:
> Updated commit description to note that the driver performs big-endian FIFO
> accesses locally (the v8 core-helper patches were dropped).
> Dropped the big-endian MMIO infrastructure patches from the series
> ("asm-generic/io.h: Add big-endian MMIO accessors", "i3c: fix big-endian FIFO
> transfers", and "i3c: master: Add endianness support for
> i3c_readl_fifo()/i3c_writel_fifo()"). The driver now performs big-endian FIFO
> accesses locally using ioread32be()/iowrite32be() with
> get_unaligned()/put_unaligned(), so the series is self-contained and no longer
> includes internals.h.
> Replaced the async completion/transfer-queue machinery with a simple
> synchronous transfer path under the existing mutex.
> Reworked response handling: added enum i3c_error_code to struct xi3c_cmd,
> named the response codes, return -ENODEV/-EIO as appropriate and set err =
> I3C_ERROR_M2/M0 so the i3c core and callers can tell a NACK apart from a bus
> error; propagate err to CCC commands and to each priv xfer (including actual_len).
> Switched from .priv_xfers to the new .i3c_xfers op; reject non-SDR modes with -
> EOPNOTSUPP and report actual_len.
> Reworked DAA: assign addresses incrementally, bound the device count (-
> ENOSPC), detect end-of-enumeration via -ENODEV, zero-initialize the PID buffers,
> and check i3c_master_add_i3c_dev_locked().
> Avoid busy-spinning: sleep with usleep_range() in the FIFO drain/fill loops.
> Use FIELD_PREP() with named command-FIFO field masks instead of open-coded
> shifts, and convert the register-accessor macros to inline functions.
> Split the overloaded timeout macro into XI3C_RESP_TIMEOUT_US and
> XI3C_XFER_TIMEOUT_MS with documented units, and add
> XI3C_POLL_INTERVAL_US.
> xi3c_clk_cfg(): use NSEC_PER_SEC and named timing constants, guard against
> unsigned underflow, and handle I3C_BUS_MODE_MIXED_SLOW.
> Dropped ENTHDR from supports_ccc_cmd() (SDR-only), and dispatch CCCs using
> the I3C_CCC_DIRECT bit.
> Use const for TX buffers and drop the related casts; use parity8() for the DAA parity
> bit.
> Updated MODULE_DESCRIPTION and authors, the copyright year, renamed the
> Kconfig symbol to AMD_AXI_I3C_MASTER, and fixed the MAINTAINERS entry
> (title, mailing list, and the correct binding filename).
>
> Changes for V8:
> Used time_left instead of timeout.
> Used __free(kfree) for xfer to simplify err path in multiple places.
>
> Changes for V7:
> Updated timeout macro name.
> Updated xi3c_master_wr_to_tx_fifo() and xi3c_master_rd_from_rx_fifo() to use
> i3c_writel_fifo() and i3c_readl_fifo().
>
> Changes for V6:
> Removed typecast for xi3c_getrevisionnumber(), xi3c_wrfifolevel(), and
> xi3c_rdfifolevel().
> Replaced dynamic allocation with a static variable for pid_bcr_dcr.
> Fixed sparse warning in do_daa by typecasting the address parity value to u8.
> Fixed sparse warning in xi3c_master_bus_init by typecasting the pid value to u64 in
> info.pid calculation.
>
> Changes for V5:
> Used GENMASK_ULL for PID mask as it's 64bit mask.
>
> Changes for V4:
> Updated timeout macros.
> Removed type casting for xi3c_is_resp_available() macro.
> Used ioread32() and iowrite32() instead of readl() and writel() to keep consistency.
> Read XI3C_RESET_OFFSET reg before udelay().
> Removed xi3c_master_free_xfer() and directly used kfree().
> Skipped checking return value of i3c_master_add_i3c_dev_locked().
> Used devm_mutex_init() instead of mutex_init().
>
> Changes for V3:
> Resolved merge conflicts.
>
> Changes for V2:
> Updated commit description.
> Added mixed mode support with clock configuration.
> Converted smaller functions into inline functions.
> Used FIELD_GET() in xi3c_get_response().
> Updated xi3c_master_rd_from_rx_fifo() to use cmd->rx_buf.
> Used parity8() for address parity calculation.
> Added guards for locks.
> Dropped num_targets and updated xi3c_master_do_daa().
> Used __free(kfree) in xi3c_master_send_bdcast_ccc_cmd().
> Dropped PM runtime support.
> Updated xi3c_master_read() and xi3c_master_write() with
> xi3c_is_resp_available() check.
> Created separate functions: xi3c_master_init() and xi3c_master_reinit().
> Used xi3c_master_init() in bus initialization and xi3c_master_reinit() in error paths.
> Added DAA structure to xi3c_master structure.
> ---
>  MAINTAINERS                         |    8 +
>  drivers/i3c/master/Kconfig          |   15 +
>  drivers/i3c/master/Makefile         |    1 +
>  drivers/i3c/master/amd-i3c-master.c | 1060 +++++++++++++++++++++++++++
>  4 files changed, 1084 insertions(+)
>  create mode 100644 drivers/i3c/master/amd-i3c-master.c
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 461a3eed6129..bfaa6999913c 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -1035,6 +1035,14 @@ L:     linux-sound@vger.kernel.org
>  S:   Supported
>  F:   sound/soc/amd/
>
> +AMD AXI I3C MASTER DRIVER
> +M:   Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>
> +M:   Shubham Patil <shubhamsanjay.patil@amd.com>
> +L:   linux-i3c@lists.infradead.org
> +S:   Maintained
> +F:   Documentation/devicetree/bindings/i3c/xlnx,axi-i3c-1.0.yaml
> +F:   drivers/i3c/master/amd-i3c-master.c
> +
>  AMD AXI W1 DRIVER
>  M:   Kris Chaplin <kris.chaplin@amd.com>
>  R:   Thomas Delev <thomas.delev@amd.com>
> diff --git a/drivers/i3c/master/Kconfig b/drivers/i3c/master/Kconfig index
> 2609f2b18e0a..da96d2aaa399 100644
> --- a/drivers/i3c/master/Kconfig
> +++ b/drivers/i3c/master/Kconfig
> @@ -86,3 +86,18 @@ config RENESAS_I3C
>
>         This driver can also be built as a module. If so, the module will be
>         called renesas-i3c.
> +
> +config AMD_AXI_I3C_MASTER
> +     tristate "AMD AXI I3C Master driver"
> +     depends on HAS_IOMEM
> +     help
> +       Support for the AMD AXI I3C master controller, a soft IP used on
> +       AMD (Xilinx) FPGAs and adaptive SoCs with ARM or MicroBlaze
> +       processors.
> +
> +       The controller currently supports Standard Data Rate (SDR) mode.
> +       Features include Dynamic Address Assignment, private transfers,
> +       and CCC transfers in both broadcast and direct modes.
> +
> +       This driver can also be built as a module. If so, the module
> +       will be called amd-i3c-master.
> diff --git a/drivers/i3c/master/Makefile b/drivers/i3c/master/Makefile index
> 816a227b6f7a..8d82196dcf83 100644
> --- a/drivers/i3c/master/Makefile
> +++ b/drivers/i3c/master/Makefile
> @@ -6,3 +6,4 @@ obj-$(CONFIG_AST2600_I3C_MASTER)      += ast2600-i3c-
> master.o
>  obj-$(CONFIG_SVC_I3C_MASTER)         += svc-i3c-master.o
>  obj-$(CONFIG_MIPI_I3C_HCI)           += mipi-i3c-hci/
>  obj-$(CONFIG_RENESAS_I3C)            += renesas-i3c.o
> +obj-$(CONFIG_AMD_AXI_I3C_MASTER)     += amd-i3c-master.o
> diff --git a/drivers/i3c/master/amd-i3c-master.c b/drivers/i3c/master/amd-i3c-master.c
> new file mode 100644
> index 000000000000..34ab1028c3ce
> --- /dev/null
> +++ b/drivers/i3c/master/amd-i3c-master.c
> @@ -0,0 +1,1060 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * I3C master driver for the AMD I3C controller.
> + *
> + * Copyright (C) 2026, Advanced Micro Devices, Inc.
> + */
> +
> +#include <linux/bitfield.h>
> +#include <linux/bitops.h>
> +#include <linux/cleanup.h>
> +#include <linux/clk.h>
> +#include <linux/delay.h>
> +#include <linux/err.h>
> +#include <linux/i3c/master.h>
> +#include <linux/io.h>
> +#include <linux/iopoll.h>
> +#include <linux/kernel.h>
> +#include <linux/module.h>
> +#include <linux/mutex.h>
> +#include <linux/of.h>
> +#include <linux/platform_device.h>
> +#include <linux/slab.h>
> +#include <linux/time.h>
> +#include <linux/unaligned.h>
> +
> +#define XI3C_VERSION_OFFSET                  0x00    /* Version Register */
> +#define XI3C_RESET_OFFSET                    0x04    /* Soft Reset Register */
> +#define XI3C_CR_OFFSET                               0x08    /* Control Register */
> +#define XI3C_ADDRESS_OFFSET                  0x0C    /* Target Address
> Register */
> +#define XI3C_SR_OFFSET                               0x10    /* Status Register */
> +#define XI3C_CMD_FIFO_OFFSET                 0x20    /* I3C Command
> FIFO Register */
> +#define XI3C_WR_FIFO_OFFSET                  0x24    /* I3C Write Data FIFO
> Register */
> +#define XI3C_RD_FIFO_OFFSET                  0x28    /* I3C Read Data FIFO
> Register */
> +#define XI3C_RESP_STATUS_FIFO_OFFSET         0x2C    /* I3C Response
> status FIFO Register */
> +#define XI3C_FIFO_LVL_STATUS_OFFSET          0x30    /* CMD slots free
> | WR-FIFO free (words) */
> +#define XI3C_FIFO_LVL_STATUS_1_OFFSET                0x34    /* RESP fill | RD-
> FIFO fill level (words) */
> +#define XI3C_SCL_HIGH_TIME_OFFSET            0x38    /* I3C SCL HIGH
> Register */
> +#define XI3C_SCL_LOW_TIME_OFFSET             0x3C    /* I3C SCL LOW
> Register */
> +#define XI3C_SDA_HOLD_TIME_OFFSET            0x40    /* I3C SDA
> HOLD Register */
> +#define XI3C_TSU_START_OFFSET                        0x48    /* I3C START
> SETUP Register */
> +#define XI3C_THD_START_OFFSET                        0x4C    /* I3C START
> HOLD Register */
> +#define XI3C_TSU_STOP_OFFSET                 0x50    /* I3C STOP
> Setup Register */
> +#define XI3C_OD_SCL_HIGH_TIME_OFFSET         0x54    /* I3C OD SCL
> HIGH Register */
> +#define XI3C_OD_SCL_LOW_TIME_OFFSET          0x58    /* I3C OD SCL
> LOW Register */
> +#define XI3C_PID0_OFFSET                     0x6C    /* LSB 4 bytes of the
> PID */
> +#define XI3C_PID1_BCR_DCR                    0x70    /* MSB 2 bytes of the
> PID, BCR and DCR */
> +
> +#define XI3C_CR_EN_MASK                              BIT(0)  /* Core Enable */
> +#define XI3C_CR_RESUME_MASK                  BIT(2)  /* Core Resume
> */
> +#define XI3C_SR_RESP_NOT_EMPTY_MASK          BIT(4)  /* Resp Fifo not
> empty status mask */
> +#define XI3C_RD_FIFO_NOT_EMPTY_MASK          BIT(15) /* Read
> Fifo not empty status mask */
> +
> +#define XI3C_BCR_MASK                                GENMASK(23, 16)
> +#define XI3C_DCR_MASK                                GENMASK(31, 24)
> +#define XI3C_PID_MASK                                GENMASK_ULL(63, 16)
> +#define XI3C_TIMING_MASK                     GENMASK(17, 0)
> +#define XI3C_REV_NUM_MASK                    GENMASK(15, 8)
> +#define XI3C_PID1_MASK                               GENMASK(15, 0)
> +#define XI3C_FIFO_LEVEL_MASK                 GENMASK(15, 0)
> +#define XI3C_RESP_CODE_MASK                  GENMASK(8, 5)
> +#define XI3C_RESP_CODE_SUCCESS                       0       /* Transfer
> completed OK */
> +#define XI3C_RESP_CODE_NO_TARGET             2       /* 7E NACK: no
> target on bus */
> +#define XI3C_RESP_CODE_NACK                  3       /* Target NACK /
> CE2 / DAA end */
> +#define XI3C_ADDR_MASK                               GENMASK(6, 0)
> +#define XI3C_FIFOS_RST_MASK                  GENMASK(4, 1)
> +
> +/* Command FIFO word layout (bit ranges encoded in the GENMASK/BIT args) */
> +#define XI3C_CMD_TYPE                                GENMASK(3, 0)   /*
> command type */
> +#define XI3C_CMD_TERMINATE                   BIT(4)          /* terminate (last
> cmd of xfer) */
> +#define XI3C_CMD_ADDR                                GENMASK(15, 8)  /* target
> address << 1 | RnW */
> +#define XI3C_CMD_LEN                         GENMASK(27, 16) /*
> payload length in bytes */
> +#define XI3C_CMD_TID                         GENMASK(31, 28) /* transfer
> ID */
> +
> +#define XI3C_OD_TLOW_NS                              500000
> +#define XI3C_OD_THIGH_NS                     41000
> +#define XI3C_I2C_TCASMIN_NS                  600000
> +#define XI3C_TCASMIN_NS                              260000
> +#define XI3C_MAXDATA_LENGTH                  4095
> +#define XI3C_MAX_DEVS                                32
> +#define XI3C_DAA_SLAVEINFO_READ_BYTECOUNT    8
> +
> +#define XI3C_THOLD_MIN_REV0                  5       /* Min SDA hold cycles,
> rev 0 IP */
> +#define XI3C_THOLD_MIN_REV1                  6       /* Min SDA hold cycles,
> rev >= 1 IP */
> +#define XI3C_CYCLE_ADJUST                    2       /* SCL/SDA pre-bias for
> HW pipeline */
> +#define XI3C_FIFO_RESET_DELAY_US             10      /* HW settling time after
> FIFO reset */
> +#define XI3C_POLL_INTERVAL_US                        10      /*
> readl_poll_timeout() sleep slice */
> +
> +#define XI3C_I2C_MODE                                0
> +#define XI3C_I2C_TID                         0
> +#define XI3C_SDR_MODE                                1
> +#define XI3C_SDR_TID                         1
> +
> +#define XI3C_WORD_LEN                                4
> +
> +/*
> + * XI3C_RESP_TIMEOUT_US is in microseconds because it is passed as the
> + * timeout_us argument of readl_poll_timeout(). XI3C_XFER_TIMEOUT_MS is
> +in
> + * milliseconds because it feeds msecs_to_jiffies(). Keep the two units
> + * distinct in the names so callers cannot mix them up.
> + */
> +#define XI3C_RESP_TIMEOUT_US                 500000
> +#define XI3C_XFER_TIMEOUT_MS                 1000
> +
> +struct xi3c_cmd {
> +     const void *tx_buf;
> +     void *rx_buf;
> +     u16 tx_len;
> +     u16 rx_len;
> +     u8 addr;
> +     u8 type;
> +     u8 tid;
> +     bool rnw;
> +     bool is_daa;
> +     bool continued;
> +     enum i3c_error_code err;
> +};
> +
> +struct xi3c_xfer {
> +     unsigned int ncmds;
> +     struct xi3c_cmd cmds[] __counted_by(ncmds); };
> +
> +/**
> + * struct xi3c_master - I3C master controller state.
> + * @base: I3C master controller embedded by the framework.
> + * @dev: Pointer to the backing device structure.
> + * @membase: Memory base of the HW registers.
> + * @pclk: Input clock driving the controller.
> + * @lock: Serializes transfers and CCC submission.
> + * @daa: ENTDAA enumeration state.
> + * @daa.addrs: Dynamic addresses assigned in enumeration order.
> + * @daa.index: Number of responders enumerated so far.
> + */
> +struct xi3c_master {
> +     struct i3c_master_controller base;
> +     struct device *dev;
> +     void __iomem *membase;
> +     struct clk *pclk;
> +     struct mutex lock; /* serializes transfers and CCC submission */
> +     struct {
> +             u8 addrs[XI3C_MAX_DEVS];
> +             u8 index;
> +     } daa;
> +};
> +
> +static inline struct xi3c_master *
> +to_xi3c_master(struct i3c_master_controller *master) {
> +     return container_of(master, struct xi3c_master, base); }
> +
> +static inline u8 xi3c_get_revision_number(struct xi3c_master *master) {
> +     return FIELD_GET(XI3C_REV_NUM_MASK,
> +                      ioread32(master->membase + XI3C_VERSION_OFFSET)); }
> +
> +static inline u16 xi3c_wr_fifo_level(struct xi3c_master *master) {
> +     return ioread32(master->membase + XI3C_FIFO_LVL_STATUS_OFFSET) &
> +            XI3C_FIFO_LEVEL_MASK;
> +}
> +
> +static inline u16 xi3c_rd_fifo_level(struct xi3c_master *master) {
> +     return ioread32(master->membase +
> XI3C_FIFO_LVL_STATUS_1_OFFSET) &
> +            XI3C_FIFO_LEVEL_MASK;
> +}
> +
> +static inline bool xi3c_is_resp_available(struct xi3c_master *master) {
> +     return FIELD_GET(XI3C_SR_RESP_NOT_EMPTY_MASK,
> +                      ioread32(master->membase + XI3C_SR_OFFSET)); }
> +
> +static int xi3c_get_response(struct xi3c_master *master, struct
> +xi3c_cmd *cmd) {
> +     u32 response_data;
> +     u32 resp_reg;
> +     u8 code;
> +     int ret;
> +
> +     ret = readl_poll_timeout(master->membase + XI3C_SR_OFFSET,
> +                              resp_reg,
> +                              resp_reg & XI3C_SR_RESP_NOT_EMPTY_MASK,
> +                              XI3C_POLL_INTERVAL_US,
> XI3C_RESP_TIMEOUT_US);
> +     if (ret) {
> +             dev_err(master->dev, "XI3C response timeout\n");
> +             return ret;
> +     }
> +
> +     response_data = ioread32(master->membase +
> XI3C_RESP_STATUS_FIFO_OFFSET);
> +     code = FIELD_GET(XI3C_RESP_CODE_MASK, response_data);
> +
> +     switch (code) {
> +     case XI3C_RESP_CODE_SUCCESS:
> +             cmd->err = I3C_ERROR_UNKNOWN;
> +             return 0;
> +     case XI3C_RESP_CODE_NO_TARGET:
> +     case XI3C_RESP_CODE_NACK:
> +             /*
> +              * Target did not ACK. Record it as I3C_ERROR_M2 so callers
> +              * (and the i3c core, which keys on err == I3C_ERROR_M2) can
> +              * tell a NACK apart from other failures. A normal transfer
> +              * surfaces this as -EIO per the i3c_xfer contract; the DAA
> +              * path instead expects -ENODEV as its enumeration terminator.
> +              */
> +             cmd->err = I3C_ERROR_M2;
> +             return cmd->is_daa ? -ENODEV : -EIO;
> +     default:
> +             cmd->err = I3C_ERROR_M0;
> +             dev_err(master->dev, "XI3C transfer error, response code %u\n",
> +                     code);
> +             return -EIO;
> +     }
> +}
> +
> +static inline void xi3c_writesl_be(void __iomem *addr, const void *buffer,
> +                                unsigned int count)
> +{
> +     const u32 *buf = buffer;
> +
> +     while (count--)
> +             iowrite32be(get_unaligned(buf++), addr); }
> +
> +static inline void xi3c_readsl_be(const void __iomem *addr, void *buffer,
> +                               unsigned int count)
> +{
> +     u32 *buf = buffer;
> +
> +     while (count--)
> +             put_unaligned(ioread32be(addr), buf++); }
> +
> +static inline void xi3c_writel_fifo(void __iomem *addr, const void *buf,
> +                                 int nbytes)
> +{
> +     xi3c_writesl_be(addr, buf, nbytes / 4);
> +     if (nbytes & 3) {
> +             u32 tmp = 0;
> +
> +             memcpy(&tmp, (const u8 *)buf + (nbytes & ~3), nbytes & 3);
> +             xi3c_writesl_be(addr, &tmp, 1);
> +     }
> +}
> +
> +static inline void xi3c_readl_fifo(const void __iomem *addr, void *buf,
> +                                int nbytes)
> +{
> +     xi3c_readsl_be(addr, buf, nbytes / 4);
> +     if (nbytes & 3) {
> +             u32 tmp;
> +
> +             xi3c_readsl_be(addr, &tmp, 1);
> +             memcpy((u8 *)buf + (nbytes & ~3), &tmp, nbytes & 3);
> +     }
> +}
> +
> +static void xi3c_master_write_to_cmdfifo(struct xi3c_master *master,
> +                                      struct xi3c_cmd *cmd, u16 len)
> +{
> +     u32 transfer_cmd;
> +     u8 addr;
> +
> +     addr = ((cmd->addr & XI3C_ADDR_MASK) << 1) | (u8)cmd->rnw;
> +
> +     transfer_cmd  = FIELD_PREP(XI3C_CMD_TYPE, cmd->type);
> +     transfer_cmd |= FIELD_PREP(XI3C_CMD_TERMINATE, !cmd->continued);
> +     transfer_cmd |= FIELD_PREP(XI3C_CMD_ADDR, addr);
> +     transfer_cmd |= FIELD_PREP(XI3C_CMD_TID, cmd->tid);
> +
> +     /*
> +      * For dynamic addressing, an additional 1-byte length must be added
> +      * to the command FIFO to account for the address present in the TX FIFO
> +      */
> +     if (cmd->is_daa) {
> +             xi3c_writel_fifo(master->membase + XI3C_WR_FIFO_OFFSET,
> +                              cmd->tx_buf, cmd->tx_len);
> +
> +             len++;
> +     }
> +
> +     transfer_cmd |= FIELD_PREP(XI3C_CMD_LEN, len);
> +     iowrite32(transfer_cmd, master->membase + XI3C_CMD_FIFO_OFFSET); }
> +
> +static inline void xi3c_master_enable(struct xi3c_master *master) {
> +     iowrite32(ioread32(master->membase + XI3C_CR_OFFSET) |
> XI3C_CR_EN_MASK,
> +               master->membase + XI3C_CR_OFFSET);
> +}
> +
> +static inline void xi3c_master_disable(struct xi3c_master *master) {
> +     iowrite32(ioread32(master->membase + XI3C_CR_OFFSET) &
> ~XI3C_CR_EN_MASK,
> +               master->membase + XI3C_CR_OFFSET);
> +}
> +
> +static inline void xi3c_master_resume(struct xi3c_master *master) {
> +     iowrite32(ioread32(master->membase + XI3C_CR_OFFSET) |
> +               XI3C_CR_RESUME_MASK, master->membase +
> XI3C_CR_OFFSET); }
> +
> +static void xi3c_master_reset_fifos(struct xi3c_master *master) {
> +     u32 data;
> +
> +     /* Assert FIFO reset. */
> +     data = ioread32(master->membase + XI3C_RESET_OFFSET);
> +     data |= XI3C_FIFOS_RST_MASK;
> +     iowrite32(data, master->membase + XI3C_RESET_OFFSET);
> +     /* Read-back flushes the posted write before the settling delay below. */
> +     ioread32(master->membase + XI3C_RESET_OFFSET);
> +     udelay(XI3C_FIFO_RESET_DELAY_US);
> +
> +     /* De-assert FIFO reset, then wait for the FIFOs to come back up. */
> +     data &= ~XI3C_FIFOS_RST_MASK;
> +     iowrite32(data, master->membase + XI3C_RESET_OFFSET);
> +     ioread32(master->membase + XI3C_RESET_OFFSET);
> +     udelay(XI3C_FIFO_RESET_DELAY_US);
> +}
> +
> +static inline void xi3c_master_init(struct xi3c_master *master) {
> +     /* Reset fifos */
> +     xi3c_master_reset_fifos(master);
> +
> +     /* Enable controller */
> +     xi3c_master_enable(master);
> +}
> +
> +static inline void xi3c_master_reinit(struct xi3c_master *master) {
> +     /* Reset fifos */
> +     xi3c_master_reset_fifos(master);
> +
> +     /* Resume controller */
> +     xi3c_master_resume(master);
> +}
> +
> +static struct xi3c_xfer *xi3c_master_alloc_xfer(unsigned int ncmds) {
> +     struct xi3c_xfer *xfer;
> +
> +     xfer = kzalloc(struct_size(xfer, cmds, ncmds), GFP_KERNEL);
> +     if (!xfer)
> +             return NULL;
> +
> +     xfer->ncmds = ncmds;
> +
> +     return xfer;
> +}
> +
> +static void xi3c_master_rd_from_rx_fifo(struct xi3c_master *master,
> +                                     struct xi3c_cmd *cmd)
> +{
> +     u16 rx_data_available;
> +     u16 copy_len;
> +     u16 len;
> +
> +     rx_data_available = xi3c_rd_fifo_level(master);
> +     len = rx_data_available * XI3C_WORD_LEN;
> +
> +     if (!len)
> +             return;
> +
> +     copy_len = min_t(u16, len, cmd->rx_len);
> +     xi3c_readl_fifo(master->membase + XI3C_RD_FIFO_OFFSET,
> +                     (u8 *)cmd->rx_buf, copy_len);
> +
> +     cmd->rx_buf = (u8 *)cmd->rx_buf + copy_len;
> +     cmd->rx_len -= copy_len;
> +}
> +
> +static int xi3c_master_read(struct xi3c_master *master, struct xi3c_cmd
> +*cmd) {
> +     unsigned long timeout;
> +     u32 status_reg;
> +     int ret;
> +
> +     if (!cmd->rx_buf || cmd->rx_len > XI3C_MAXDATA_LENGTH)
> +             return -EINVAL;
> +
> +     /* Fill command fifo */
> +     xi3c_master_write_to_cmdfifo(master, cmd, cmd->rx_len);
> +
> +     if (!cmd->rx_len)
> +             return 0;
> +
> +     ret = readl_poll_timeout(master->membase + XI3C_SR_OFFSET,
> +                              status_reg,
> +                              status_reg & (XI3C_RD_FIFO_NOT_EMPTY_MASK
> |
> +                                            XI3C_SR_RESP_NOT_EMPTY_MASK),
> +                              XI3C_POLL_INTERVAL_US,
> XI3C_RESP_TIMEOUT_US);
> +     if (ret) {
> +             dev_err(master->dev, "XI3C read timeout\n");
> +             return ret;
> +     }
> +
> +     if (!(status_reg & XI3C_RD_FIFO_NOT_EMPTY_MASK))
> +             return 0;
> +
> +     timeout = jiffies + msecs_to_jiffies(XI3C_XFER_TIMEOUT_MS);
> +
> +     /* Read data from rx fifo */
> +     while (cmd->rx_len > 0 && !xi3c_is_resp_available(master)) {
> +             if (time_after(jiffies, timeout)) {
> +                     dev_err(master->dev, "XI3C read timeout\n");
> +                     return -EIO;
> +             }
> +             xi3c_master_rd_from_rx_fifo(master, cmd);
> +             usleep_range(XI3C_POLL_INTERVAL_US, 2 *
> XI3C_POLL_INTERVAL_US);
> +     }
> +
> +     /* Read remaining data */
> +     xi3c_master_rd_from_rx_fifo(master, cmd);
> +
> +     return 0;
> +}
> +
> +static void xi3c_master_wr_to_tx_fifo(struct xi3c_master *master,
> +                                   struct xi3c_cmd *cmd)
> +{
> +     u16 wrfifo_space;
> +     u16 len;
> +
> +     wrfifo_space = xi3c_wr_fifo_level(master);
> +     if (cmd->tx_len > wrfifo_space * XI3C_WORD_LEN)
> +             len = wrfifo_space * XI3C_WORD_LEN;
> +     else
> +             len = cmd->tx_len;
> +
> +     if (len) {
> +             xi3c_writel_fifo(master->membase + XI3C_WR_FIFO_OFFSET,
> cmd->tx_buf,
> +                              len);
> +
> +             cmd->tx_buf = (const u8 *)cmd->tx_buf + len;
> +             cmd->tx_len -= len;
> +     }
> +}
> +
> +static int xi3c_master_write(struct xi3c_master *master, struct
> +xi3c_cmd *cmd) {
> +     unsigned long timeout;
> +     u16 cmd_len;
> +
> +     if (!cmd->tx_buf || cmd->tx_len > XI3C_MAXDATA_LENGTH)
> +             return -EINVAL;
> +
> +     cmd_len = cmd->tx_len;
> +
> +     /* Fill Tx fifo */
> +     xi3c_master_wr_to_tx_fifo(master, cmd);
> +
> +     /* Write to command fifo */
> +     xi3c_master_write_to_cmdfifo(master, cmd, cmd_len);
> +
> +     timeout = jiffies + msecs_to_jiffies(XI3C_XFER_TIMEOUT_MS);
> +     /* Fill if any remaining data to tx fifo */
> +     while (cmd->tx_len > 0 && !xi3c_is_resp_available(master)) {
> +             if (time_after(jiffies, timeout)) {
> +                     dev_err(master->dev, "XI3C write timeout\n");
> +                     return -EIO;
> +             }
> +
> +             xi3c_master_wr_to_tx_fifo(master, cmd);
> +             usleep_range(XI3C_POLL_INTERVAL_US, 2 *
> XI3C_POLL_INTERVAL_US);
> +     }
> +
> +     return 0;
> +}
> +
> +static int xi3c_master_xfer(struct xi3c_master *master, struct xi3c_cmd
> +*cmd) {
> +     int ret;
> +
> +     if (cmd->rnw)
> +             ret = xi3c_master_read(master, cmd);
> +     else
> +             ret = xi3c_master_write(master, cmd);
> +
> +     if (ret)
> +             goto err_xfer_out;
> +
> +     ret = xi3c_get_response(master, cmd);
> +     if (ret)
> +             goto err_xfer_out;
> +
> +     return 0;
> +
> +err_xfer_out:
> +     xi3c_master_reinit(master);
> +     return ret;
> +}
> +
> +static int xi3c_master_common_xfer(struct xi3c_master *master,
> +                                struct xi3c_xfer *xfer)
> +{
> +     unsigned int i;
> +     int ret;
> +
> +     guard(mutex)(&master->lock);
> +
> +     for (i = 0; i < xfer->ncmds; i++) {
> +             ret = xi3c_master_xfer(master, &xfer->cmds[i]);
> +             if (ret)
> +                     return ret;
> +     }
> +
> +     return 0;
> +}
> +
> +static int xi3c_master_do_daa(struct i3c_master_controller *m) {
> +     u8
> pid_bufs[XI3C_MAX_DEVS][XI3C_DAA_SLAVEINFO_READ_BYTECOUNT] = {};
> +     struct xi3c_master *master = to_xi3c_master(m);
> +     struct xi3c_xfer *xfer __free(kfree) = NULL;
> +     struct xi3c_cmd *daa_cmd;
> +     int addr, ret, i;
> +     u8 last_addr = 0;
> +     u8 *pid_buf;
> +     u8 ccc_id;
> +
> +     xfer = xi3c_master_alloc_xfer(1);
> +     if (!xfer)
> +             return -ENOMEM;
> +
> +     /* Fill ENTDAA CCC */
> +     ccc_id = I3C_CCC_ENTDAA;
> +     daa_cmd = &xfer->cmds[0];
> +     daa_cmd->addr = I3C_BROADCAST_ADDR;
> +     daa_cmd->rnw = false;
> +     daa_cmd->tx_buf = &ccc_id;
> +     daa_cmd->tx_len = 1;
> +     daa_cmd->type = XI3C_SDR_MODE;
> +     daa_cmd->tid = XI3C_SDR_TID;
> +     daa_cmd->continued = true;
> +
> +     ret = xi3c_master_common_xfer(master, xfer);
> +     /*
> +      * A NACK on the ENTDAA broadcast (I3C_ERROR_M2) means no slaves
> are
> +      * present to enter DAA. Treat as a successful no-op after letting
> +      * err_daa reinitialize the controller.
> +      */
> +     if (ret && daa_cmd->err == I3C_ERROR_M2) {
> +             ret = 0;
> +             goto err_daa;
> +     }
> +     if (ret)
> +             goto err_daa;
> +
> +     master->daa.index = 0;
> +
> +     while (true) {
> +             struct xi3c_cmd *cmd = &xfer->cmds[0];
> +             u8 daa_byte;
> +
> +             if (master->daa.index >= XI3C_MAX_DEVS) {
> +                     ret = -ENOSPC;
> +                     goto err_daa;
> +             }
> +
> +             addr = i3c_master_get_free_addr(m, last_addr + 1);
> +             if (addr < 0) {
> +                     ret = addr;
> +                     goto err_daa;
> +             }
> +
> +             pid_buf = pid_bufs[master->daa.index];
> +
> +             daa_byte = (addr << 1) | (parity8(addr) ^ 1);
> +
> +             cmd->tx_buf = &daa_byte;
> +             cmd->tx_len = 1;
> +             cmd->addr = I3C_BROADCAST_ADDR;
> +             cmd->rnw = true;
> +             cmd->rx_buf = pid_buf;
> +             cmd->rx_len = XI3C_DAA_SLAVEINFO_READ_BYTECOUNT;
> +             cmd->is_daa = true;
> +             cmd->type = XI3C_SDR_MODE;
> +             cmd->tid = XI3C_SDR_TID;
> +             cmd->continued = true;
> +
> +             ret = xi3c_master_common_xfer(master, xfer);
> +
> +             /*
> +              * End of enumeration: the next responder NACK'd the
> +              * dynamic-address grant, surfaced as -ENODEV.
> +              * xi3c_master_xfer() has already reset the FIFOs and
> +              * resumed the core for us; just exit the loop and
> +              * register the responders collected so far.
> +              */
> +             if (ret == -ENODEV) {
> +                     ret = 0;
> +                     break;
> +             }
> +             if (ret)
> +                     goto err_daa;
> +
> +             master->daa.addrs[master->daa.index] = addr;
> +             last_addr = addr;
> +             master->daa.index++;
> +     }
> +
> +     for (i = 0; i < master->daa.index; i++) {
> +             u64 pid;
> +
> +             ret = i3c_master_add_i3c_dev_locked(m, master->daa.addrs[i]);
> +             if (ret)
> +                     goto err_daa;
> +
> +             pid = FIELD_GET(XI3C_PID_MASK,
> +                             get_unaligned_be64(pid_bufs[i]));
> +             dev_dbg(master->dev, "Client %d: PID: 0x%llx\n", i, pid);
> +     }
> +
> +     return 0;
> +
> +err_daa:
> +     xi3c_master_reinit(master);
> +     return ret;
> +}
> +
> +static bool
> +xi3c_master_supports_ccc_cmd(struct i3c_master_controller *master,
> +                          const struct i3c_ccc_cmd *cmd)
> +{
> +     if (cmd->ndests > 1)
> +             return false;
> +
> +     switch (cmd->id) {
> +     case I3C_CCC_ENEC(true):
> +     case I3C_CCC_ENEC(false):
> +     case I3C_CCC_DISEC(true):
> +     case I3C_CCC_DISEC(false):
> +     case I3C_CCC_ENTAS(0, true):
> +     case I3C_CCC_ENTAS(0, false):
> +     case I3C_CCC_RSTDAA(true):
> +     case I3C_CCC_RSTDAA(false):
> +     case I3C_CCC_ENTDAA:
> +     case I3C_CCC_SETMWL(true):
> +     case I3C_CCC_SETMWL(false):
> +     case I3C_CCC_SETMRL(true):
> +     case I3C_CCC_SETMRL(false):
> +     case I3C_CCC_SETDASA:
> +     case I3C_CCC_SETNEWDA:
> +     case I3C_CCC_GETMWL:
> +     case I3C_CCC_GETMRL:
> +     case I3C_CCC_GETPID:
> +     case I3C_CCC_GETBCR:
> +     case I3C_CCC_GETDCR:
> +     case I3C_CCC_GETSTATUS:
> +     case I3C_CCC_GETMXDS:
> +             return true;
> +     default:
> +             return false;
> +     }
> +}
> +
> +static int xi3c_master_send_bdcast_ccc_cmd(struct xi3c_master *master,
> +                                        struct i3c_ccc_cmd *ccc)
> +{
> +     struct xi3c_xfer *xfer __free(kfree) = NULL;
> +     u8 *buf __free(kfree) = NULL;
> +     struct xi3c_cmd *cmd;
> +     u16 xfer_len;
> +     int ret;
> +
> +     if (ccc->dests[0].payload.len >= XI3C_MAXDATA_LENGTH)
> +             return -EINVAL;
> +
> +     xfer_len = ccc->dests[0].payload.len + 1;
> +
> +     xfer = xi3c_master_alloc_xfer(1);
> +     if (!xfer)
> +             return -ENOMEM;
> +
> +     buf = kmalloc(xfer_len, GFP_KERNEL);
> +     if (!buf)
> +             return -ENOMEM;
> +
> +     buf[0] = ccc->id;
> +     memcpy(&buf[1], ccc->dests[0].payload.data,
> +ccc->dests[0].payload.len);
> +
> +     cmd = &xfer->cmds[0];
> +     cmd->addr = ccc->dests[0].addr;
> +     cmd->rnw = ccc->rnw;
> +     cmd->tx_buf = buf;
> +     cmd->tx_len = xfer_len;
> +     cmd->type = XI3C_SDR_MODE;
> +     cmd->tid = XI3C_SDR_TID;
> +     cmd->continued = false;
> +
> +     ret = xi3c_master_common_xfer(master, xfer);
> +     ccc->err = cmd->err;
> +
> +     return ret;
> +}
> +
> +static int xi3c_master_send_direct_ccc_cmd(struct xi3c_master *master,
> +                                        struct i3c_ccc_cmd *ccc)
> +{
> +     struct xi3c_xfer *xfer __free(kfree) = NULL;
> +     struct xi3c_cmd *cmd;
> +     int ret;
> +
> +     if (ccc->dests[0].payload.len > XI3C_MAXDATA_LENGTH)
> +             return -EINVAL;
> +
> +     xfer = xi3c_master_alloc_xfer(2);
> +     if (!xfer)
> +             return -ENOMEM;
> +
> +     /* Broadcasted message */
> +     cmd = &xfer->cmds[0];
> +     cmd->addr = I3C_BROADCAST_ADDR;
> +     cmd->rnw = false;
> +     cmd->tx_buf = &ccc->id;
> +     cmd->tx_len = 1;
> +     cmd->type = XI3C_SDR_MODE;
> +     cmd->tid = XI3C_SDR_TID;
> +     cmd->continued = true;
> +
> +     /* Directed message */
> +     cmd = &xfer->cmds[1];
> +     cmd->addr = ccc->dests[0].addr;
> +     cmd->rnw = ccc->rnw;
> +     if (cmd->rnw) {
> +             cmd->rx_buf = ccc->dests[0].payload.data;
> +             cmd->rx_len = ccc->dests[0].payload.len;
> +     } else {
> +             cmd->tx_buf = ccc->dests[0].payload.data;
> +             cmd->tx_len = ccc->dests[0].payload.len;
> +     }
> +     cmd->type = XI3C_SDR_MODE;
> +     cmd->tid = XI3C_SDR_TID;
> +     cmd->continued = false;
> +
> +     ret = xi3c_master_common_xfer(master, xfer);
> +
> +     /*
> +      * Report the broadcast command's error if it failed, otherwise the
> +      * directed command's, so a NACK on either phase reaches the caller.
> +      */
> +     ccc->err = xfer->cmds[0].err ? xfer->cmds[0].err : xfer->cmds[1].err;
> +
> +     return ret;
> +}
> +
> +static int xi3c_master_send_ccc_cmd(struct i3c_master_controller *m,
> +                                 struct i3c_ccc_cmd *cmd)
> +{
> +     struct xi3c_master *master = to_xi3c_master(m);
> +
> +     if (cmd->id & I3C_CCC_DIRECT)
> +             return xi3c_master_send_direct_ccc_cmd(master, cmd);
> +
> +     return xi3c_master_send_bdcast_ccc_cmd(master, cmd); }
> +
> +static int xi3c_master_i3c_xfers(struct i3c_dev_desc *dev,
> +                              struct i3c_xfer *xfers,
> +                              int nxfers, enum i3c_xfer_mode mode) {
> +     struct i3c_master_controller *m = i3c_dev_get_master(dev);
> +     struct xi3c_master *master = to_xi3c_master(m);
> +     struct xi3c_xfer *xfer __free(kfree) = NULL;
> +     int i, ret;
> +
> +     if (!nxfers)
> +             return 0;
> +
> +     if (mode != I3C_SDR)
> +             return -EOPNOTSUPP;
> +
> +     for (i = 0; i < nxfers; i++)
> +             if (xfers[i].len > XI3C_MAXDATA_LENGTH)
> +                     return -EINVAL;
> +
> +     xfer = xi3c_master_alloc_xfer(nxfers);
> +     if (!xfer)
> +             return -ENOMEM;
> +
> +     for (i = 0; i < nxfers; i++) {
> +             struct xi3c_cmd *cmd = &xfer->cmds[i];
> +
> +             cmd->addr = dev->info.dyn_addr;
> +             cmd->rnw = xfers[i].rnw;
> +
> +             if (cmd->rnw) {
> +                     cmd->rx_buf = xfers[i].data.in;
> +                     cmd->rx_len = xfers[i].len;
> +             } else {
> +                     cmd->tx_buf = xfers[i].data.out;
> +                     cmd->tx_len = xfers[i].len;
> +             }
> +
> +             cmd->type = XI3C_SDR_MODE;
> +             cmd->tid = XI3C_SDR_TID;
> +             cmd->continued = (i + 1) < nxfers;
> +     }
> +
> +     ret = xi3c_master_common_xfer(master, xfer);
> +
> +     for (i = 0; i < nxfers; i++) {
> +             xfers[i].err = xfer->cmds[i].err;
> +             if (xfers[i].rnw)
> +                     xfers[i].actual_len = xfers[i].len - xfer->cmds[i].rx_len;
> +     }
> +
> +     return ret;
> +}
> +
> +static int xi3c_master_i2c_xfers(struct i2c_dev_desc *dev,
> +                              struct i2c_msg *xfers,
> +                              int nxfers)
> +{
> +     struct i3c_master_controller *m = i2c_dev_get_master(dev);
> +     struct xi3c_master *master = to_xi3c_master(m);
> +     struct xi3c_xfer *xfer __free(kfree) = NULL;
> +     int i;
> +
> +     if (!nxfers)
> +             return 0;
> +
> +     for (i = 0; i < nxfers; i++)
> +             if (xfers[i].len > XI3C_MAXDATA_LENGTH)
> +                     return -EINVAL;
> +
> +     xfer = xi3c_master_alloc_xfer(nxfers);
> +     if (!xfer)
> +             return -ENOMEM;
> +
> +     for (i = 0; i < nxfers; i++) {
> +             struct xi3c_cmd *cmd = &xfer->cmds[i];
> +
> +             cmd->addr = xfers[i].addr & XI3C_ADDR_MASK;
> +             cmd->rnw = !!(xfers[i].flags & I2C_M_RD);
> +
> +             if (cmd->rnw) {
> +                     cmd->rx_buf = xfers[i].buf;
> +                     cmd->rx_len = xfers[i].len;
> +             } else {
> +                     cmd->tx_buf = xfers[i].buf;
> +                     cmd->tx_len = xfers[i].len;
> +             }
> +
> +             cmd->type = XI3C_I2C_MODE;
> +             cmd->tid = XI3C_I2C_TID;
> +             cmd->continued = (i + 1) < nxfers;
> +     }
> +
> +     return xi3c_master_common_xfer(master, xfer); }
> +
> +static int xi3c_clk_cfg(struct xi3c_master *master, unsigned long
> +sclhz, u8 mode) {
> +     unsigned long core_rate, core_periodns;
> +     u32 tcasmin, tsustart, tsustop, thdstart;
> +     u32 thigh, tlow, thold;
> +     u32 odthigh, odtlow;
> +
> +     core_rate = clk_get_rate(master->pclk);
> +     if (!core_rate)
> +             return -EINVAL;
> +
> +     if (!sclhz)
> +             return -EINVAL;
> +
> +     core_periodns = DIV_ROUND_UP(NSEC_PER_SEC, core_rate);
> +
> +     thigh = DIV_ROUND_UP(core_rate, sclhz) >> 1;
> +     tlow = thigh;
> +
> +     if (thigh <= XI3C_CYCLE_ADJUST)
> +             return -EINVAL;
> +
> +     /* Hold time : 40% of tlow time */
> +     thold = (tlow * 4) / 10;
> +
> +     if (xi3c_get_revision_number(master) == 0)
> +             thold = max_t(u32, thold, XI3C_THOLD_MIN_REV0);
> +     else
> +             thold = max_t(u32, thold, XI3C_THOLD_MIN_REV1);
> +
> +     iowrite32((thigh - XI3C_CYCLE_ADJUST) & XI3C_TIMING_MASK,
> +               master->membase + XI3C_SCL_HIGH_TIME_OFFSET);
> +     iowrite32((tlow - XI3C_CYCLE_ADJUST) & XI3C_TIMING_MASK,
> +               master->membase + XI3C_SCL_LOW_TIME_OFFSET);
> +     iowrite32((thold - XI3C_CYCLE_ADJUST) & XI3C_TIMING_MASK,
> +               master->membase + XI3C_SDA_HOLD_TIME_OFFSET);
> +
> +     if (mode == XI3C_I2C_MODE) {
> +             iowrite32((thigh - XI3C_CYCLE_ADJUST) & XI3C_TIMING_MASK,
> +                       master->membase +
> XI3C_OD_SCL_HIGH_TIME_OFFSET);
> +             iowrite32((tlow - XI3C_CYCLE_ADJUST) & XI3C_TIMING_MASK,
> +                       master->membase +
> XI3C_OD_SCL_LOW_TIME_OFFSET);
> +
> +             tcasmin = DIV_ROUND_UP(XI3C_I2C_TCASMIN_NS,
> core_periodns);
> +     } else {
> +             odtlow = DIV_ROUND_UP(XI3C_OD_TLOW_NS, core_periodns);
> +             odthigh = DIV_ROUND_UP(XI3C_OD_THIGH_NS, core_periodns);
> +
> +             odtlow = max(tlow, odtlow);
> +             odthigh = min(thigh, odthigh);
> +
> +             if (odthigh <= XI3C_CYCLE_ADJUST)
> +                     return -EINVAL;
> +
> +             iowrite32((odthigh - XI3C_CYCLE_ADJUST) &
> XI3C_TIMING_MASK,
> +                       master->membase +
> XI3C_OD_SCL_HIGH_TIME_OFFSET);
> +             iowrite32((odtlow - XI3C_CYCLE_ADJUST) & XI3C_TIMING_MASK,
> +                       master->membase +
> XI3C_OD_SCL_LOW_TIME_OFFSET);
> +
> +             tcasmin = DIV_ROUND_UP(XI3C_TCASMIN_NS, core_periodns);
> +     }
> +
> +     thdstart = max(thigh, tcasmin);
> +     tsustart = max(tlow, tcasmin);
> +     tsustop = max(tlow, tcasmin);
> +
> +     iowrite32((tsustart - XI3C_CYCLE_ADJUST) & XI3C_TIMING_MASK,
> +               master->membase + XI3C_TSU_START_OFFSET);
> +     iowrite32((thdstart - XI3C_CYCLE_ADJUST) & XI3C_TIMING_MASK,
> +               master->membase + XI3C_THD_START_OFFSET);
> +     iowrite32((tsustop - XI3C_CYCLE_ADJUST) & XI3C_TIMING_MASK,
> +               master->membase + XI3C_TSU_STOP_OFFSET);
> +
> +     return 0;
> +}
> +
> +static int xi3c_master_bus_init(struct i3c_master_controller *m) {
> +     struct xi3c_master *master = to_xi3c_master(m);
> +     struct i3c_bus *bus = i3c_master_get_bus(m);
> +     struct i3c_device_info info = {};
> +     unsigned long sclhz;
> +     u32 pid1_bcr_dcr;
> +     u8 mode;
> +     int ret;
> +
> +     switch (bus->mode) {
> +     case I3C_BUS_MODE_MIXED_FAST:
> +     case I3C_BUS_MODE_MIXED_LIMITED:
> +     case I3C_BUS_MODE_MIXED_SLOW:
> +             mode = XI3C_I2C_MODE;
> +             sclhz = bus->scl_rate.i2c;
> +             break;
> +     case I3C_BUS_MODE_PURE:
> +             mode = XI3C_SDR_MODE;
> +             sclhz = bus->scl_rate.i3c;
> +             break;
> +     default:
> +             return -EINVAL;
> +     }
> +
> +     ret = xi3c_clk_cfg(master, sclhz, mode);
> +     if (ret)
> +             return ret;
> +
> +     xi3c_master_init(master);
> +
> +     /* Get an address for the master. */
> +     ret = i3c_master_get_free_addr(m, 0);
> +     if (ret < 0)
> +             return ret;
> +
> +     info.dyn_addr = ret;
> +
> +     /* Write the dynamic address value to the address register. */
> +     iowrite32(info.dyn_addr, master->membase + XI3C_ADDRESS_OFFSET);
> +
> +     /* Read PID, BCR and DCR values, and assign to i3c device info. */
> +     pid1_bcr_dcr = ioread32(master->membase + XI3C_PID1_BCR_DCR);
> +     info.pid = ((u64)FIELD_GET(XI3C_PID1_MASK, pid1_bcr_dcr) << 32) |
> +                ioread32(master->membase + XI3C_PID0_OFFSET);
> +     info.bcr = FIELD_GET(XI3C_BCR_MASK, pid1_bcr_dcr);
> +     info.dcr = FIELD_GET(XI3C_DCR_MASK, pid1_bcr_dcr);
> +
> +     return i3c_master_set_info(&master->base, &info); }
> +
> +static void xi3c_master_bus_cleanup(struct i3c_master_controller *m) {
> +     struct xi3c_master *master = to_xi3c_master(m);
> +
> +     xi3c_master_disable(master);
> +}
> +
> +static const struct i3c_master_controller_ops xi3c_master_ops = {
> +     .bus_init = xi3c_master_bus_init,
> +     .bus_cleanup = xi3c_master_bus_cleanup,
> +     .do_daa = xi3c_master_do_daa,
> +     .supports_ccc_cmd = xi3c_master_supports_ccc_cmd,
> +     .send_ccc_cmd = xi3c_master_send_ccc_cmd,
> +     .i3c_xfers = xi3c_master_i3c_xfers,
> +     .i2c_xfers = xi3c_master_i2c_xfers,
> +};
> +
> +static int xi3c_master_probe(struct platform_device *pdev) {
> +     struct xi3c_master *master;
> +     int ret;
> +
> +     master = devm_kzalloc(&pdev->dev, sizeof(*master), GFP_KERNEL);
> +     if (!master)
> +             return -ENOMEM;
> +
> +     master->dev = &pdev->dev;
> +
> +     master->membase = devm_platform_ioremap_resource(pdev, 0);
> +     if (IS_ERR(master->membase))
> +             return dev_err_probe(master->dev, PTR_ERR(master->membase),
> +                                  "Failed to map registers\n");
> +
> +     master->pclk = devm_clk_get_enabled(master->dev, NULL);
> +     if (IS_ERR(master->pclk))
> +             return dev_err_probe(master->dev, PTR_ERR(master->pclk),
> +                                  "Failed to get and enable clock\n");
> +
> +     ret = devm_mutex_init(master->dev, &master->lock);
> +     if (ret)
> +             return ret;
> +
> +     platform_set_drvdata(pdev, master);
> +
> +     return i3c_master_register(&master->base, master->dev,
> +                                &xi3c_master_ops, false);
> +}
> +
> +static void xi3c_master_remove(struct platform_device *pdev) {
> +     struct xi3c_master *master = platform_get_drvdata(pdev);
> +
> +     i3c_master_unregister(&master->base);
> +}
> +
> +static const struct of_device_id xi3c_master_of_ids[] = {
> +     { .compatible = "xlnx,axi-i3c-1.0" },
> +     { },
> +};
> +MODULE_DEVICE_TABLE(of, xi3c_master_of_ids);
> +
> +static struct platform_driver xi3c_master_driver = {
> +     .probe = xi3c_master_probe,
> +     .remove = xi3c_master_remove,
> +     .driver = {
> +             .name = "axi-i3c-master",
> +             .of_match_table = xi3c_master_of_ids,
> +     },
> +};
> +module_platform_driver(xi3c_master_driver);
> +
> +MODULE_AUTHOR("Manikanta Guntupalli <manikanta.guntupalli@amd.com>");
> +MODULE_AUTHOR("Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>");
> +MODULE_AUTHOR("Shubham Patil <shubhamsanjay.patil@amd.com>");
I don't agree with adding new authors in V9.

This driver is already part of the downstream kernel and is being used:
https://github.com/Xilinx/linux-xlnx/blob/master/drivers/i3c/master/amd-i3c-master.c

The main purpose of V9 is to drop the framework-level support added in recent versions. The current V9 patch is mostly aligned with the initial patch versions (without framework support changes).

Thanks,
Manikanta

> +MODULE_DESCRIPTION("AMD AXI I3C master driver");
> MODULE_LICENSE("GPL");
> --
> 2.34.1


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
