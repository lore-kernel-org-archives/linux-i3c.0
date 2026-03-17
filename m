Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C057FFD8740
	for <linux-i3c@archiver.kernel.org>; Tue, 17 Mar 2026 11:34:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zh8zR7lAyzqsSr8KODugpRAz5pvz3JinIYs1lTaW5LI=; b=4wOJmWHdBwYpau
	qq9NjWJjTVJLs/YhWljA0xYj41Ve61zjwtDdMdeuXRQpGYib1sWT+FdoRLpxaT08wC07KSnaYpcF7
	CpSbdJYhXRtZJQ+GsvaCBivTM5HCkeuKANLst0YTnbOLbY+Ad3wf5kW3mEcS+r5CggD0a9Q/cLyyY
	e3/1yHMWCxwnQu2aVv7REapbpoilz6ZmiX7ixtvJn0ZgbuiMZARjixabOR6SZHARQW1ylNnFiZ9uM
	PGlvuMN3ja9WfAt/DvA7XFI7cW930aArHRwEVoeLOkoXfx55Vk9Vpm8V/m9XvEuDBy5K550DCWbva
	OqG/dhaYon7PrlNAnD0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2Sgm-000000069f3-2C95;
	Tue, 17 Mar 2026 11:34:20 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2Sgk-000000069dz-1f8T
	for linux-i3c@bombadil.infradead.org;
	Tue, 17 Mar 2026 11:34:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=MIME-Version:Content-Transfer-Encoding
	:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=MSstWJajEH+iaZ092N/i1NOVZmtzBvs6ucaqEuENf6E=; b=EyX7KG6Nmv/hn+w7GcM/xwJuuu
	MquvYSv6nsWg9hDgMlYAIe2hu6cCvCHvlf4MRYW7/CpBrQhnt9Twa58b8xfwxqsik5OmV+LZcC3ws
	k+sAwhiDm8Cidl0XslYPgU9ieSmgO/p4JlNjLmhrqrPZ6dkjVmj8xMv0AWoY+cIbl9qDiVfIwW6cV
	uUrDa+mIz8ZkoK0n5WSSylmBr8qCYbzA2u+ZAC4bYbPYa2ZmsLm9Vzw6KOvaKGrTUR2tD0pU+2gRt
	gM8Rnoyrhgu8AyzjhuZ2/e2V0ci0Kuv2k3T23GLKJGBLWs0+hDNLTrWkR4VLmaNNXYjHjuOHCwm0V
	POGTKkrQ==;
Received: from mail-francesouthazon11011029.outbound.protection.outlook.com ([40.107.130.29] helo=MRWPR03CU001.outbound.protection.outlook.com)
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2Sgh-00000008q9v-0U7l
	for linux-i3c@lists.infradead.org;
	Tue, 17 Mar 2026 11:34:16 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dZCAfXX+Cpu4yHQQEJmDqO0bAmylJhWCorLy46E9EZZUNWL4LkmQ8h6Oli/IyIC6TwK0LVU8Q35tdQ7Bx0FQNkDOu+BzZ5Tq/1csv0ZHtDdvLTOiYJW+Do/CnQ7kLtoWorQOyy+AkPIYxyMUdcP92jdWAmIYtpPQcEv9qg1ZBjM3aTux4kQZmapixbmexLbV6RecDgT6O2dRtdrzPDub+8/fNyjAsGq41dFZvJ1/xiKOauykUmd4HHpRC7NOZf7qlQAlvpZnOdCSDy/SyF8o9y/5u5O57zlMujqXxOy9o255D5o/qbR5jODsHis4Q1rpk1X3KAB23S5gUd/KVsRTkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MSstWJajEH+iaZ092N/i1NOVZmtzBvs6ucaqEuENf6E=;
 b=GwGdfctxQ1GwMja3aCZyboc7vGEdftf7AnU6AHoM/ppSq8U7M4+P/ECPHESLE3x837yILEDTNtcFFxLjg/KLC7c0xkxNUNSHsuiXxWQ89Wnh5D4Ece186O1vEzf8t6jbYeO+Uua+XwwdVIv/8oX86vS/Onbf8q8lsTyyDzQg9a4uHK6WVzXi3X3/ebErgTFHPos/Y3bepQLO2XD0a1k5wDGycNDRgN1iuZPJNre1hhvmct7wncBrrGvwFbNN1TaADyjKG1dpjNprpFsFjacm2WF2RmaFbPbitnvyfDyYCDaYQ1cJdwQGMDvPh6EZv1O7ztVuy9DH0BSIj27EZwcTqQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MSstWJajEH+iaZ092N/i1NOVZmtzBvs6ucaqEuENf6E=;
 b=mNVuDhc4erKqCfBGo/u8MoUqJcU2MQUDtRXTDcMsXzQVckK2TQzlVT3Ay/NmrnwW8dJP+7yMZHXfMeX0G3cVYihSBxHwYEjNGEt6fbIH4Wke0GsrITK7F+Z+hCIur+mBNsDwLqjHVK/SGlPGu2lzGdYOhr92E9F8bQkAwnQHU3l4j6u8S63zpVruAl3N6BxW3Bn909N13P9Xv1a0qDGoIa7XV8uisrN1phnvz4g+bYV2psqPjgevsAoX4PgZMH3N3obYEvgwViau+Cj38EP/Z4n4y608o592p6T/iV/TwO6/ZWiIQEJx5tcoc19/LlRtimuyDmdCjKgDaM+NckwD2A==
Received: from AS4PR04MB9362.eurprd04.prod.outlook.com (2603:10a6:20b:4e7::9)
 by AM0PR04MB7172.eurprd04.prod.outlook.com (2603:10a6:208:192::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.24; Tue, 17 Mar
 2026 11:34:07 +0000
Received: from AS4PR04MB9362.eurprd04.prod.outlook.com
 ([fe80::abe7:4a6e:a51:baf0]) by AS4PR04MB9362.eurprd04.prod.outlook.com
 ([fe80::abe7:4a6e:a51:baf0%6]) with mapi id 15.20.9700.018; Tue, 17 Mar 2026
 11:34:02 +0000
From: Lakshay Piplani <lakshay.piplani@nxp.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
CC: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-i3c@lists.infradead.org" <linux-i3c@lists.infradead.org>,
	"alexandre.belloni@bootlin.com" <alexandre.belloni@bootlin.com>,
	"krzk+dt@kernel.org" <krzk+dt@kernel.org>, "robh@kernel.org"
	<robh@kernel.org>, "conor+dt@kernel.org" <conor+dt@kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"broonie@kernel.org" <broonie@kernel.org>, "lee@kernel.org" <lee@kernel.org>,
	Frank Li <frank.li@nxp.com>, "lgirdwood@gmail.com" <lgirdwood@gmail.com>,
	Vikash Bansal <vikash.bansal@nxp.com>, Priyanka Jain <priyanka.jain@nxp.com>,
	Aman Kumar Pandey <aman.kumarpandey@nxp.com>
Subject: RE: [EXT] Re: [PATCH v6 3/7] dt-bindings: i3c: Add NXP P3H2x4x
 i3c-hub support
Thread-Topic: [EXT] Re: [PATCH v6 3/7] dt-bindings: i3c: Add NXP P3H2x4x
 i3c-hub support
Thread-Index: AQHcsFstbeRrFutBCkyz6OBrlMui6LWo27+AgAN3JZCAAFGogIAF/f1g
Date: Tue, 17 Mar 2026 11:34:01 +0000
Message-ID: <AS4PR04MB9362F90E42A990CE0620B992FB41A@AS4PR04MB9362.eurprd04.prod.outlook.com>
References: <20260310065727.3759342-1-lakshay.piplani@nxp.com>
 <20260310065727.3759342-3-lakshay.piplani@nxp.com>
 <20260311-outrageous-unnatural-jerboa-53f5a8@quoll>
 <AS4PR04MB936254136A4791441EDA2F91FB45A@AS4PR04MB9362.eurprd04.prod.outlook.com>
 <f0960746-e9e8-4a86-8800-31b8a7a29920@kernel.org>
In-Reply-To: <f0960746-e9e8-4a86-8800-31b8a7a29920@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS4PR04MB9362:EE_|AM0PR04MB7172:EE_
x-ms-office365-filtering-correlation-id: 01148fe6-4aeb-4e96-8879-08de841916a7
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7416014|19092799006|22082099003|18002099003|56012099003|38070700021;
x-microsoft-antispam-message-info: Xdwb4rY8Mw00RgQQjJUEuGyte4FMVPU+dm4byhD7ijQiwvOBEifZzi8CGOxee/OW8UxM2VbEgyXQnIY5j/hxXJbnMzm/iKm+PumWgCMjZ2LXlTFH6LP3WfaPYPyJqAquhj48pNuzbE7JR+hhiTPyMz/jioKBHgDOGYjjfnkaKcAX8JAqQEozzlBGA5pqCPZ4uwy93Jc8h4P/HzmdoGCVeFyp+1uNFMpz9tJeIcxFdpAE9RlxtPeQwvpK0sLamZ6/4emPttIDNa4zJFF7dqMwfr7m/vi+lo3h/D1YTjxxdBp3xx8963cxI6GI9bOEkRUKh1pgKIQeoOpnX8DOVtk5mESia1AZQT8XUecCZ5HID2JBb8awdDB2qwREbaeJyXAArbfh6iHjpjT7jMelsrKW+TohnfAy0nSzLS+1CPrjbITgjbbX9gsJ310iyMk/enXsX/uSi+TkSjwnTipbHartA6o1Ung2brE6gnQV47VC/l9jp8ff9JrZzwTBdoHSD+DK7ETPrP3GgeY26T5+8LKMnH+ljQx8W5uBghKksicLfJym+XRp5+Mdarb2EEKu35sZ9zziPD2ZK7C6YwKGcBe2MMPop5adUY7clrPxYsnCalqVaVd0ofADDO3/c7WRwsNNIkRcNbMZ266YEZhn7ZgJRm1MxeakmNAO5dbDEKUrFYAXQb4bAfsK6Xo32yN9zvLiAwrbWiyUZ06JSGhHULABE/G6VDTFOrxuJiob6YyqTMXQRnvtTG5k1wlTFP52E9fq+4r1/D6sPDrzD05KA6LL+SJtaQE7yUNsOrbXX+0U914=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR04MB9362.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014)(19092799006)(22082099003)(18002099003)(56012099003)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?S2FWaTF5VUpQZkRzaWVkbmo0VVQzZ3FtWTlZRVIwQm9TUjZteml1YVhLUWJK?=
 =?utf-8?B?UVRLa1VjRmticWxjMHUvbFRFLy9MMjFGek10K21jUzRIOXBvanhXOFhiNmFP?=
 =?utf-8?B?eEl5cFk0dzFPT0F6ZHMydFhRT1gyTnFoRjhIY1E1MXNJeWNOT2pSeWE4bFhq?=
 =?utf-8?B?SlBzNjREVnVYSUVKZmJtYkcxd2NmWWo5RGNQZ0w5QVFpSlROTnAvU1k4TjdN?=
 =?utf-8?B?a3RpZ1A5RnU1WldOSU1Oa0VQNzljT3dzZGVVWGI0VkFHTFpYMnRMcWY3MW9V?=
 =?utf-8?B?NTdDYUZTUVlKZTRyQ0lISkJuaUpCODZoSmhoVmFXcGFrcGxLVW9IbXE0RDRQ?=
 =?utf-8?B?amUzS3M3MkNaa3VaUkxTeFUrc3dOOUlLODRDaHBIaXNsYjR3SGEwYzEzcE1H?=
 =?utf-8?B?OUttS0pBQnMrVjBOcWFZUnhNWkN5eHdIN0VYKytDakY4M2EzV1BGbHU3L21l?=
 =?utf-8?B?elNuUWpDL2hIemNKMXJnOGFCL2tTNWRNSWJOMHhtc0RFTG9iTFY1Rm44T2pm?=
 =?utf-8?B?Z09YWWdldG9VTWl5TTJPMFZqWVQ5UmJ2TDBZOFNMOUdFNS94Y3QwTUVjY1cx?=
 =?utf-8?B?MGE5dEl5N1pwdTBNM3JzSExveTQ5WWtOUCtvbmM4emhXZ0lIanNDaGZYdFQ1?=
 =?utf-8?B?ZzdaQktVcmFaL282VDJxQXhGVm9ES3B3K2Vjc1FvYmcxczViMHNQQmRiS2dR?=
 =?utf-8?B?Q3g5WWQ2QWEzV0VPK2NpdlIzUytZaWF3NUFVY1YwSVd3NUt4ck9ZWlRWMjQ4?=
 =?utf-8?B?b3VPeW0raTZxR2JKc0VOV2s5Yk5ndVNhVndIMFlwdU02MlRyVVg0cWkraUV3?=
 =?utf-8?B?NjJPN2NZRWRveFBTdElMOHpoakltZXdKdVY4RURXQnNVNkdJN3N0YkNqYmFh?=
 =?utf-8?B?Y1dQSGxHbGlSVG9zSnFLellXNSt3bjh2c0tGVGx6VzlCUmtENFB6L29PV1Yr?=
 =?utf-8?B?TE4yT1BFVDBualpqa0s4elJtdlJuemVHMmRheTFIR2xsVW1GdFhhZ0hMbGw4?=
 =?utf-8?B?ZEdYYU9HNVh1bkRxQUo1SWRJL0EzVVBGbGlvbklCc3ZtQUJEYkxJWmdudFo1?=
 =?utf-8?B?Y2I2MVFlVTBCZU9yWWZEaGYvKzVqeXRFSm1hRk9yRnNBdlVISDNONTVJZzB0?=
 =?utf-8?B?a29teUhkMG1OcVJZRlA2bWFuM1oya1JVSHVGVTJ4czBxL3JmNXdMTnhXQ1dQ?=
 =?utf-8?B?NFIzR051amtURXVLSWx4VlJlako1b1dnaDEwRWZ5aGc2ZzQwUjl4UDdFaEU0?=
 =?utf-8?B?OTkySDdDTVNSRE5jWU5jSGZWcCtGM2dXWDFhekdXS3BsOXlCOXZqaElQTERC?=
 =?utf-8?B?SHlXK1ZZZVFiV1ROY3hGejdZVGQ0RXNWSlFFbzBXOEkzeGFjbzJjTml0MEJp?=
 =?utf-8?B?Z0tuY0VIUVkzVUszVkVIdzNQNUxWeEUrYmdFcHhXN0llZE1sS3VCTnR3ZVlW?=
 =?utf-8?B?TFVVWndlMVdaVDFqUk9aRGFMdDBNTFJEYTZKNnRwVm00K3l5MVdRR3dZb0V2?=
 =?utf-8?B?Q3lZWHNaa1FKM2tHV1VwOWpyYy8zcVNCcUtLWDh3UkFiNTQ1YU00cXhEYzV6?=
 =?utf-8?B?c3ZzVXRSUmRZRTlaTUtOSlFUYXJBek1EbTFzYmtrYm1vUExJZ1VRVzNjMDZm?=
 =?utf-8?B?UTkwVm1TaFBIUjRRbTNydHErT3NPOXE1MVVhQWtLOEVpY2tLekU4YXpDeC9K?=
 =?utf-8?B?TnhXbWpSR0d6TDF3MUpCVlJ1S2l4ZjRXUWV3Y1d4c2dVdmtvUFUyc3p4dVo5?=
 =?utf-8?B?VFIrQVhHclRQNmptRURZRDZLbjlXVCt1U1pBaks5Uk1IL296M3ZVTGZheHh6?=
 =?utf-8?B?aFhRY2dJd0VTdzFZYzdQb0dJSUpHSThFVTVFaEM5bjhXS1RwUHVxaW5mMUZR?=
 =?utf-8?B?b2g4dU4vd1RPQWp4b05tM3o3Nzh6aUFHOUVRWGp4bUdMemgyMXd3U1A2eHR4?=
 =?utf-8?B?WnVUWDRvczk0T0RxYTZQcmF2Z2x5aTVXSy9STTBkOGNlK0NEVi96MlhHaWhp?=
 =?utf-8?B?clZ2RjhKQm5vVzdveGNvemxUcmZaR0hHZklNK202V3JHWXpPUlpPbTV1RzRK?=
 =?utf-8?B?VmY3RWpBcnZUV1pTRVREOVhGa0ZodTlaN0xRRFZEQTl1Z2xsaUVPWU1VZjRH?=
 =?utf-8?B?NU93TmVCVWNlNGV1VmxsV0pybmw2L3ZFa2k1MGc5TEd5d2xxSXVoZWhGdStV?=
 =?utf-8?B?b1p3aXBQNTZuS2FnV2Rla216NHo3aVZYRm9wb1pTSDVuUnZlVmJldDM3amVJ?=
 =?utf-8?B?RUYzL2t3dDVYTU5VNnhJZzZ3NVRzMzUyZTRMZXozQUtyTUZsQ0k5T2NnN2xS?=
 =?utf-8?B?RDBmYUdKUmJOK2d0MnY0aloyRW1XTjBzTjdzZnFQSGZhWDl0UW5tQT09?=
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS4PR04MB9362.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 01148fe6-4aeb-4e96-8879-08de841916a7
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Mar 2026 11:34:02.1273
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: NtRleyKTwAWvPxW+s0RCCTaySZNTN4zxdjNWTfDiZ3UJ13v6Y9+aAPDzSA4cGzU8nzr45QHqLf7CoPy/SkGaNQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB7172
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260317_113415_230624_59708184 
X-CRM114-Status: GOOD (  27.24  )
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

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogS3J6eXN6dG9mIEtvemxv
d3NraSA8a3J6a0BrZXJuZWwub3JnPg0KPiBTZW50OiBGcmlkYXksIE1hcmNoIDEzLCAyMDI2IDk6
MzEgUE0NCj4gVG86IExha3NoYXkgUGlwbGFuaSA8bGFrc2hheS5waXBsYW5pQG54cC5jb20+DQo+
IENjOiBsaW51eC1rZXJuZWxAdmdlci5rZXJuZWwub3JnOyBsaW51eC1pM2NAbGlzdHMuaW5mcmFk
ZWFkLm9yZzsNCj4gYWxleGFuZHJlLmJlbGxvbmlAYm9vdGxpbi5jb207IGtyemsrZHRAa2VybmVs
Lm9yZzsgcm9iaEBrZXJuZWwub3JnOw0KPiBjb25vcitkdEBrZXJuZWwub3JnOyBkZXZpY2V0cmVl
QHZnZXIua2VybmVsLm9yZzsgYnJvb25pZUBrZXJuZWwub3JnOw0KPiBsZWVAa2VybmVsLm9yZzsg
RnJhbmsgTGkgPGZyYW5rLmxpQG54cC5jb20+OyBsZ2lyZHdvb2RAZ21haWwuY29tOyBWaWthc2gN
Cj4gQmFuc2FsIDx2aWthc2guYmFuc2FsQG54cC5jb20+OyBQcml5YW5rYSBKYWluIDxwcml5YW5r
YS5qYWluQG54cC5jb20+Ow0KPiBBbWFuIEt1bWFyIFBhbmRleSA8YW1hbi5rdW1hcnBhbmRleUBu
eHAuY29tPg0KPiBTdWJqZWN0OiBSZTogW0VYVF0gUmU6IFtQQVRDSCB2NiAzLzddIGR0LWJpbmRp
bmdzOiBpM2M6IEFkZCBOWFAgUDNIMng0eCBpM2MtDQo+IGh1YiBzdXBwb3J0DQo+IA0KPiBDYXV0
aW9uOiBUaGlzIGlzIGFuIGV4dGVybmFsIGVtYWlsLiBQbGVhc2UgdGFrZSBjYXJlIHdoZW4gY2xp
Y2tpbmcgbGlua3Mgb3INCj4gb3BlbmluZyBhdHRhY2htZW50cy4gV2hlbiBpbiBkb3VidCwgcmVw
b3J0IHRoZSBtZXNzYWdlIHVzaW5nIHRoZSAnUmVwb3J0DQo+IHRoaXMgZW1haWwnIGJ1dHRvbg0K
PiANCj4gDQo+IE9uIDEzLzAzLzIwMjYgMTI6MDksIExha3NoYXkgUGlwbGFuaSB3cm90ZToNCj4g
Pj4+ICtleGFtcGxlczoNCj4gPj4+ICsgIC0gfA0KPiA+Pj4gKyAgICBpM2Mgew0KPiA+Pj4gKyAg
ICAgICAgI2FkZHJlc3MtY2VsbHMgPSA8Mz47DQo+ID4+PiArICAgICAgICAjc2l6ZS1jZWxscyA9
IDwwPjsNCj4gPj4+ICsNCj4gPj4+ICsgICAgICAgIGh1YkA3MCwyMzYxNTMwMDBjMiB7DQo+ID4+
PiArICAgICAgICAgICAgcmVnID0gPDB4NzAgMHgyMzYgMHgzMDAwYzI+Ow0KPiA+Pg0KPiA+PiBX
aGVyZSBpcyB0aGUgY29tcGF0aWJsZT8NCj4gPj4NCj4gPj4gU28gdGhpcyB3YXNuJ3QgY2hlY2tl
ZC90ZXN0ZWQuIFRyeSB5b3Vyc2VsZiwgcmVtb3ZlIHJlcXVpcmVkDQo+ID4+IHByb3BlcnRpZXMg
YW5kIHNlZSBpZiB0aGVyZSBpcyBhbiBlcnJvci4gTm8gZXJyb3IsIHJpZ2h0Pw0KPiA+Pg0KPiA+
PiBCZXN0IHJlZ2FyZHMsDQo+ID4+IEtyenlzenRvZg0KPiA+DQo+ID4gSGkgS3J6eXN6dG9mLA0K
PiA+DQo+ID4gVGhhbmtzIGZvciBwb2ludGluZyB0aGlzIG91dC4NCj4gPg0KPiA+IEluIHRoaXMg
YmluZGluZywgY29tcGF0aWJsZSBpcyBub3QgYSByZXF1aXJlZCBwcm9wZXJ0eSBieSBkZXNpZ24u
IFRoZQ0KPiA+IFAzSDJ4NHggaHViIGNhbiBhcHBlYXIgb24gZWl0aGVyIGFuIEkzQyBidXMgb3Ig
YW4gSTJDIGJ1cy4gRm9yIEkzQw0KPiA+IGluc3RhbnRpYXRpb25zLCB0aGUgZGV2aWNlIGlzICBz
ZWxmLWRpc2NvdmVyYWJsZSB2aWEgRHluYW1pYyBBZGRyZXNzDQo+ID4gQXNzaWdubWVudCAoREFB
KSBhbmQgaXRzIFBJRC9EQ1IsIHNvLCB0aGUgZHJpdmVyIGRvZXMgbm90IHJlbHkgb24gYQ0KPiBj
b21wYXRpYmxlIHN0cmluZyBmb3IgbWF0Y2hpbmcuDQo+ID4NCj4gPiBUaGUgY29tcGF0aWJsZSA9
ICJueHAscDNoMjg0MCIgZW50cnkgaW4gdGhlIHNjaGVtYSBpcyBtZWFudCBvbmx5IGZvciB0aGUN
Cj4gbGVnYWN5IEkyQyBtb2RlLg0KPiA+IHdoZXJlIGEgc3RhbmRhcmQgT0YgbWF0Y2ggaXMgc3Rp
bGwgbmVlZGVkLiBTaW5jZSB3ZSBkaWQgbm90IGluY2x1ZGUgYW4NCj4gPiBJMkMgZXhhbXBsZSBp
biB0aGUgZXhhbXBsZXMgc2VjdGlvbiwgdGhlIGNvbXBhdGlibGUgcHJvcGVydHkgZG9lcyBub3QN
Cj4gPiBhcHBlYXIgdGhlcmUgYW5kIGlzIHRoZXJlZm9yZSBub3QgcmVxdWlyZWQgZm9yIEkzQyBv
bmx5IGNhc2VzLg0KPiANCj4gU28geW91IGp1c3QgYWRkZWQgc29tZXRoaW5nIHdoaWNoIHdhcyBu
ZXZlciB2ZXJpZmllZC9idWlsZCB0ZXN0ZWQuDQo+IA0KPiA+DQo+ID4gZHRfYmluZGluZ19jaGVj
ayBwYXNzZXMgYmVjYXVzZSB0aGUgc2NoZW1hIGludGVudGlvbmFsbHkgZG9lcyBub3QNCj4gPiBk
ZWNsYXJlIGNvbXBhdGlibGUgYXMgcmVxdWlyZWQsIGFuZCB0aGUgZXhhbXBsZXMgY29uZm9ybSB0
byB0aGF0Lg0KPiANCj4gUmVxdWlyaW5nIGNvbXBhdGlibGUgaXMga2luZCBvZiBpcnJlbGV2YW50
LCBiZWNhdXNlIHNjaGVtYSB3b3VsZCBqdXN0IG5vDQo+IG1hdGNoIHdpdGhvdXQgaXQuIElPVywg
aGFzIG5vIHByYWN0aWNhbCBlZmZlY3Qgb24gdGhlIHNjaGVtYS4gTGFjayBvZiAicmVxdWlyZSIN
Cj4gb2YgY29tcGF0aWJsZSBhbHNvIHRoZXJlZm9yZSBoYXMgbm8gcHJhY3RpY2FsIGltcGFjdCBv
biB0aGUgc2NoZW1hLg0KPiANCj4gQmVzdCByZWdhcmRzLA0KPiBLcnp5c3p0b2YNCg0KSGkgS3J6
eXN6dG9mLA0KDQpUaGFua3MgZm9yIHRoZSByZXZpZXcuDQoNClRvIG1ha2Ugc3VyZSBJIGFkZHJl
c3MgdGhlIGlzc3VlIGNvcnJlY3RseSwgY291bGQgeW91IHBsZWFzZSBzdWdnZXN0IHdoYXQgc3Bl
Y2lmaWMgY2hhbmdlcyB5b3Ugd291bGQNCmxpa2UgdG8gc2VlIGluIHRoaXMgZHQtYmluZGluZz8g
SSB3aWxsIHVwZGF0ZSB0aGUgc2NoZW1hIGFjY29yZGluZ2x5IGFuZCByZeKAkXJ1biBkdF9iaW5k
aW5nX2NoZWNrIHRvIA0KZW5zdXJlIHRoZSBleGFtcGxlcyBhbmQgcHJvcGVydGllcyBhcmUgcHJv
cGVybHkgdmFsaWRhdGVkLg0KDQpCZXN0IHJlZ2FyZHMsDQpMYWtzaGF5DQotLSAKbGludXgtaTNj
IG1haWxpbmcgbGlzdApsaW51eC1pM2NAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMu
aW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWkzYwo=
