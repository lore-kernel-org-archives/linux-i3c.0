Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7AAECAC5AA
	for <linux-i3c@archiver.kernel.org>; Thu, 25 Sep 2025 07:37:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OE1TE7gFQZ1xXV+VNaqP5GGRLzE4TQNIVswwp+ZZ9Is=; b=4fWOM0qrHgXS4A
	lCGfnP4CjENyEpzzxeix1AN/e//N7DNr4NBt0aA2wcKfCZPh+CtxxApyEK6V2pe76XIEwl718AXbC
	QE7aq7n7EKVxKaueiHsYV2Cgp7UFxmFU+b4GxlqMBMBpb6+qYVHoKJK3Ja/2nK+1BKEawtn9MzqR+
	hY8uv50AmnJsNiG053fpZiTge4RlZiROHyndf4OT1oAUGoZBwXA00cfvgleSxnTpeEYCi4wM3rmqF
	tcv3cZROcnQ64SgQB32a6iEXRs7IlTExNssLg5sOZJ153xQQ0mIoVHTN+gNhNlwC5OPxPEF3h0fld
	nCCcZxBgTk90/8hGXz0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1gXk-00000006mKn-1mmZ;
	Thu, 25 Sep 2025 07:37:32 +0000
Received: from mail-centralusazlp170100005.outbound.protection.outlook.com ([2a01:111:f403:c111::5] helo=DM1PR04CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1gXg-00000006mGM-03kz
	for linux-i3c@lists.infradead.org;
	Thu, 25 Sep 2025 07:37:31 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Qa7YlMJ0vjGHBfQh6T5OjOLmc7FfLKB6TRQItQ69hlc9IEWDkNdmvVxy2iopK9DevZq8GkT1IHOtaFOnsib9NTSrh8YONTPZedxKhi26180ki7K2n8F3ElXqTgpIny0YEgu8EIidieiALY3n9Yp1NgJyu06ZkNu44r8txJL4i3I/8V6K8ni4Cq7kIVUTUHRHMZtfRWRsu2hGx7egcFGBeX6ToLn2xww8VSmfa/Ws9onXTapRXpPbnfDs4L/Rl7Zb8vREx1/s7Y8c8f+57vBXGy9AhN4UpKK4tG6a5YzKaouTTGhc1XJbMFcJI/NDSQzFdDl6xnr2kUM2HHxC5Gxs/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HCqx4ntq0KMyuhmabign1cqL8kUftohyOPlylcNt6f8=;
 b=dyCW/mj7brLKcDnP3zcjWR9j9JU3wdQxstQQ/xBgcLhJkkPPeQh304PHblYStABmCUbodAKz0Jw2pdiW1+PrnNETMSwhWGcz3BqhAQA5e/p2t95lB9kQ4EIP8rbeJjtC2ePcMpItd/bV3dKNGU3m5XEv4DmzVr7RZhiIv6ry/8DgyGn6jCmnzE84T/9uITMAyDnUmUtqHR7qOpunsBw0sDigJkE+08lixSd+9TMrDxW1/Y/09+JvN2CTn4mYgeRrN0YBjds2nYhg+nnUEqlFjf+pmHrUFUaQjV1z5+raWUfhqMqxvrAtT0Rdv969zIX15VqCvhhceGHxtCWJrcOojw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HCqx4ntq0KMyuhmabign1cqL8kUftohyOPlylcNt6f8=;
 b=0cz6Q++Z32jRD6S49P89cqhpJdXUEijgLHxojyL/GIksJiCKf9T6Gj9RGEF56BO6MheDzgSkpjCDmDKm05shUQqK+ToyHwIxSiClABqhhvXrhoT4V0VQeOytZn27oMMBGEZmLqMAJZhQ6lb59qJ3Tuc8BNptRaLOfjzO48Bb7FQ=
Received: from DM4PR12MB6109.namprd12.prod.outlook.com (2603:10b6:8:ae::11) by
 SJ2PR12MB8692.namprd12.prod.outlook.com (2603:10b6:a03:543::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.19; Thu, 25 Sep
 2025 07:37:13 +0000
Received: from DM4PR12MB6109.namprd12.prod.outlook.com
 ([fe80::680c:3105:babe:b7e1]) by DM4PR12MB6109.namprd12.prod.outlook.com
 ([fe80::680c:3105:babe:b7e1%4]) with mapi id 15.20.9160.008; Thu, 25 Sep 2025
 07:37:13 +0000
From: "Guntupalli, Manikanta" <manikanta.guntupalli@amd.com>
To: Jorge Marques <gastmaier@gmail.com>, Arnd Bergmann <arnd@kernel.org>
CC: Alexandre Belloni <alexandre.belloni@bootlin.com>, Jorge Marques
	<jorge.marques@analog.com>, Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Frank Li <Frank.Li@nxp.com>, Arnd Bergmann <arnd@arndb.de>,
	"linux-i3c@lists.infradead.org" <linux-i3c@lists.infradead.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "git
 (AMD-Xilinx)" <git@amd.com>, "Simek, Michal" <michal.simek@amd.com>
Subject: RE: [PATCH] [v2] i3c: fix big-endian FIFO transfers
Thread-Topic: [PATCH] [v2] i3c: fix big-endian FIFO transfers
Thread-Index: AQHcLZBu2lcu7eR7HUOLh6RNKtQOPbSjfYIAgAAEBYA=
Date: Thu, 25 Sep 2025 07:37:12 +0000
Message-ID: <DM4PR12MB6109367F36487B582ED8EA968C1FA@DM4PR12MB6109.namprd12.prod.outlook.com>
References: <20250924201837.3691486-1-arnd@kernel.org>
 <2wtpklapw5ogsevuvk2l4ngvw7hymer2y4cc454h47u2d7tq44@4mknmpk5yzil>
In-Reply-To: <2wtpklapw5ogsevuvk2l4ngvw7hymer2y4cc454h47u2d7tq44@4mknmpk5yzil>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Enabled=True;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_SetDate=2025-09-25T07:31:15.0000000Z;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Name=Open
 Source;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_ContentBits=3;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Method=Privileged
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR12MB6109:EE_|SJ2PR12MB8692:EE_
x-ms-office365-filtering-correlation-id: d72824a3-018f-4311-2dd9-08ddfc0657cb
x-ld-processed: 3dd8961f-e488-4e60-8e11-a82d994e183d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|366016|38070700021;
x-microsoft-antispam-message-info: =?us-ascii?Q?iOGjZ+L5671q5ZDHU5rm4bqwfDwxZE3WUr8DAfTCq757aTte5NzPef9HR7uC?=
 =?us-ascii?Q?0PV+5P3PmVxw3qCp/Py19YW417zZwXP7snlxPK3oxDXNPgSI4aKc6jyqwwPc?=
 =?us-ascii?Q?fuvOJpkpxH52AWLjU1ye0695P5hr96+yx4SBHlEKQHpWR9tuI6E4d2OogJtF?=
 =?us-ascii?Q?070sfZxFZyKex8BS1rbg5O+/TyLzqZkCLwdo96moboifQOypoorAmElnGer2?=
 =?us-ascii?Q?Dz7cqkM3Uduoj1/NJrVuY8Cf0Tep9/lhN5oak+W2Ognfu/DFAjCfC6qCGuUc?=
 =?us-ascii?Q?L8x29lythmrw4JNUZZKZ1dtPUmeFmZEB5u1yW4M4Xb39NRP++De7hsONwYR0?=
 =?us-ascii?Q?7btMd7+i20D1GnQl6AKW5uqe+fQmZicS/bhRXYuP2SaU6Um7951Is8qJ/VKK?=
 =?us-ascii?Q?TmuYELrWmOGi6plynOM91Q0fULC9qcT+MAXOf9eBWZ08vCEjI9wAdaZPZVPY?=
 =?us-ascii?Q?MmX/d59R2mbZw96nJpYNrMtMcju6Qsoe41y/fOwJJJRizLT91oaxab38naXo?=
 =?us-ascii?Q?L9twJjzjOX39XCMVrrw3wrB8uBFhZRnX5KDENuyHgIb3RCBb2SFN2hyLIJUf?=
 =?us-ascii?Q?9y+t6gudVrJ7c3rDpNYjtFMHkSRS8tS4UDpB3LtjeWqYcD2Vzo1GlMOf2tNu?=
 =?us-ascii?Q?gjzoENYPNY4PsI6HUVawjMkyoU7/KO1uupIaV2wvecwOibb5vcHKFHAgwwZu?=
 =?us-ascii?Q?rsIqQM3cA6NQHkx+FqJuUQFRZd5h5SH1xOkD6ENq11kZ+oxLTJDpjCVkHRKF?=
 =?us-ascii?Q?H3ZY/aDFPc1IRBjKpowZYy5q+AMQCYiBWx8Bt+Ci/Hl8S7zMJJxwWNlDOx5C?=
 =?us-ascii?Q?vBOGbB4A6P+brqNcKPKElNr9fl0HmyyEBxG4BMuzTGrgZNHnX3nmnwLH76v3?=
 =?us-ascii?Q?ChEf8B5qC4Qkma2MffORKhSZoRp63/CbHWPelsWMq5imMEDbpEhKLWcU4JiQ?=
 =?us-ascii?Q?eVUf25V9LTUlRl3Ipurrg1DoGnrSztAAY372pm6lWYdFHrSWSqqrEWKFAqdT?=
 =?us-ascii?Q?dmfDg7/JxqhBqwp+oJ8l5EH6Jh19KxDbwhv12G4oQNUT9TuF0pv/mH713JwA?=
 =?us-ascii?Q?pJz/nc66srxi9EHMtITlDhUCE7uNU6OarQmXmQCRG8t+RYm0shDDVj7bxK9s?=
 =?us-ascii?Q?wA95brLm7qAfNvplpjIVlw5NwcdSWjGdCR4IhUeDnLQfk+vhVircBlU42i3f?=
 =?us-ascii?Q?x6/KqZXtArivJ1WxS3TAUVxQvGTfpP47D/CZbk+E/rDNfjOG9ulHEcH+/rIr?=
 =?us-ascii?Q?YdTEHVT1AjNuaFjSFO2PflHv6N/VoMLlnPWgTBvBWJD7qT2le+0mxLRW28HF?=
 =?us-ascii?Q?SD6b6EDKHzFLwA5KeXd33RlP1b2kqzbGVLpQAVK/6GQxmMo37dvC6KS2Q94v?=
 =?us-ascii?Q?Nnq86IucyKWlMklbd6JxkRgB6YSJHyMDBOa2nNIZjYqTgAHmLsHDi9SO2n1N?=
 =?us-ascii?Q?rZ+LAv+p+hSxwFhKeGb0dwniZc7VyaldLHBxn9TLzeHRZEhwpfqsjsU/X4xL?=
 =?us-ascii?Q?TLbt6dPRIuyIzQDpjmAVVb9JLRvnQsZuy3qG?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB6109.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?rxVNQ3qGvMX3HO+0qXAV+OY+7wQVoUFuC9oYNCkIoBC3PVMXGumYa548coy4?=
 =?us-ascii?Q?D3n8Zf5mm7dQ20o60di9/YPEutYzy4xGsJ+At2/47zdsjEiMoHABpHKN2qK8?=
 =?us-ascii?Q?hNjjgSffeHecsX4UIl+2XVq3/6tL2BFEvqxHAuCm+gOR5NtIZWG/MFZh+nz0?=
 =?us-ascii?Q?dzMi3Ff6BhAGev4wW1m34psPIahd1VnH/lFFoCyAyEMtcqpoZZ00kiSpjmZL?=
 =?us-ascii?Q?PISPdNos4/W+f4T1TTRO+ZOa0hNQvEeFc63XHZm3j/1LPXGbE8ESz1W1rnUY?=
 =?us-ascii?Q?lRzXcWOZM1ec2zJtemZY0zNoAw9BtRikhTy7TTD4n5RQIpuSlMxBJFPSsuPH?=
 =?us-ascii?Q?LO7Vyf5qEh0ZJRXcv7RwazIHi3IPF8SW2zw7josIjhbOyZ/ujKCW84k0ae02?=
 =?us-ascii?Q?HC5ruA5ynFfPth25gm+y/EPExYRDZZ/saU0P6uOHiKQrQciHoaTGJ4aXVDal?=
 =?us-ascii?Q?zye94e9T4VHS62mIbJEBShoCmn8FNJzVz5CdyEEVl48sPDmzl6x7lIk21e6f?=
 =?us-ascii?Q?dNNxfi2jSIT0xO4R4h6cYbWedVX9zQrgIYPFvYDFxofvuGZuT/w+1CTR8LSU?=
 =?us-ascii?Q?NqQlHW2PA1jv7rmMJnYC4cLDas8cjNRwDlyrptntZFLrB9wPyeoU8n7DMzfv?=
 =?us-ascii?Q?a65MgGbRO2vDSti9IGToWq+E+qQsaHNO7WKJa0yZJkzQ+Geh2UmIyZzo7kG6?=
 =?us-ascii?Q?U3+9VjuDYlcVwy9gfyEdsTSkT4JEVxNKaM0jpLDyw4mMYfignWvhL7Zi1CDs?=
 =?us-ascii?Q?zjPTEGgPG+bBgARGCzNn9JalVn67hcQv7k8DcDYBbMOQ8Xt8WnGJG8rnnvSk?=
 =?us-ascii?Q?PbKilAnynTvZsA+PV3QphxzYER9IaBnNdalrScKJk6ddpt2yBua5QYvMXWzX?=
 =?us-ascii?Q?Nj1k1qCnkAtqE85+myZTdyjilUVXYG2hQdpwjWySqrxyoRG+RDQ82HYjnVLl?=
 =?us-ascii?Q?0PND6fPtqZ/djPqfXrDpzmhRsxO+y4xwosw6RCxwenOzAZDL3qns4B+X0wez?=
 =?us-ascii?Q?zzPGNUpgSR/uiWP37juP0+sRfzBYgmV04KJjqDof8vAdYPGvhn/9l4MjU3ut?=
 =?us-ascii?Q?mIq++DtXoFrdyboVlewXZyI/9Kl/EB2SDBtRoOtGceZTgGMw0VUz9ubthwod?=
 =?us-ascii?Q?bO+o5N0b0STAUsgJOex3uY10vPqEW6atKiZoX3E4wiJ4+VVJ10bOGJPtLS+V?=
 =?us-ascii?Q?3v3BF4UdiPe9SD9fyf6/ikFCeD6MMk14gVaGc1B67mAnnaChmt+gfWU7zV17?=
 =?us-ascii?Q?hzmNIutzFUdBwYLhNSy9h6ndDQXaSxYpTavUDgNYYE0qwfRmRTaEcjTfV0Za?=
 =?us-ascii?Q?FWYsw0U2pGraksbqa+dyJ7YfmlbTWuonlv3N6YZ5ZUC8ubYsFxFeSlbBzOIA?=
 =?us-ascii?Q?nZJh56K3A9gQsu6NmHtjvIm4sSZ+Z6Agh4QYfZUxvAbpZ8Nv0+UKlB0ZDDzg?=
 =?us-ascii?Q?7MTYcFajT961wVGElEqTz5Ok/kARIfOpuipv0gjfbZhy2IlUQQCs3UjoiIoe?=
 =?us-ascii?Q?2QKlcPTna6niX40Rc5SwbOBcJl44MJZqqmPFQNWTWP414FE0xY7syBmoDXnC?=
 =?us-ascii?Q?FI7HuzwoJs8upZBRuXs=3D?=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB6109.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d72824a3-018f-4311-2dd9-08ddfc0657cb
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Sep 2025 07:37:12.9240
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: y6X/sFiM5HYLkT5nJIjjz3pIePYlWqs0wTUCgx14DpxRXJ/RsuXWFtNg4gO20h8S13IZ19zY/ahVDt5S/RaVbQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB8692
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250925_003728_379256_3D2CEC43 
X-CRM114-Status: GOOD (  36.72  )
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

[Public]

Hi,

> -----Original Message-----
> From: Jorge Marques <gastmaier@gmail.com>
> Sent: Thursday, September 25, 2025 12:47 PM
> To: Arnd Bergmann <arnd@kernel.org>
> Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>; Jorge Marques
> <jorge.marques@analog.com>; Wolfram Sang <wsa+renesas@sang-
> engineering.com>; Frank Li <Frank.Li@nxp.com>; Arnd Bergmann
> <arnd@arndb.de>; Guntupalli, Manikanta <manikanta.guntupalli@amd.com>; linux-
> i3c@lists.infradead.org; linux-kernel@vger.kernel.org
> Subject: Re: [PATCH] [v2] i3c: fix big-endian FIFO transfers
>
> On Wed, Sep 24, 2025 at 10:18:33PM +0200, Arnd Bergmann wrote:
> > From: Arnd Bergmann <arnd@arndb.de>
> >
> > Short MMIO transfers that are not a multiple of four bytes in size
> > need a special case for the final bytes, however the existing
> > implementation is not endian-safe and introduces an incorrect byteswap
> > on big-endian kernels.
> >
> > This usually does not cause problems because most systems are
> > little-endian and most transfers are multiple of four bytes long, but
> > still needs to be fixed to avoid the extra byteswap.
> >
> > Change the special case for both i3c_writel_fifo() and
> > i3c_readl_fifo() to use non-byteswapping writesl() and readsl() with a
> > single element instead of the byteswapping writel()/readl() that are
> > meant for individual MMIO registers. As data is copied between a FIFO
> > and a memory buffer, the writesl()/readsl() loops are typically based
> > on __raw_readl()/ __raw_writel(), resulting in the order of bytes in
> > the FIFO to match the order in the buffer, regardless of the CPU endianess.
> >
> > The earlier versions in the dw-i3c and i3c-master-cdns had a correct
> > implementation, but the generic version that was recently added broke it.
> >
> > Fixes: 733b439375b4 ("i3c: master: Add inline i3c_readl_fifo() and
> > i3c_writel_fifo()")
> > Cc: Manikanta Guntupalli <manikanta.guntupalli@amd.com>
> > Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> > ---
> > This was a recent regression, the version in 6.16 still works, but
> > 6.17-rc is broken.
> >
> > v2 changes:
> >  - add code comments
> >  - write correct data buffer
> > ---
> >  drivers/i3c/internals.h | 12 ++++++++++--
> >  1 file changed, 10 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/i3c/internals.h b/drivers/i3c/internals.h index
> > 0d857cc68cc5..79ceaa5f5afd 100644
> > --- a/drivers/i3c/internals.h
> > +++ b/drivers/i3c/internals.h
> > @@ -38,7 +38,11 @@ static inline void i3c_writel_fifo(void __iomem *addr, const
> void *buf,
> >             u32 tmp = 0;
> >
> >             memcpy(&tmp, buf + (nbytes & ~3), nbytes & 3);
> > -           writel(tmp, addr);
> > +           /*
> > +            * writesl() instead of writel() to keep FIFO
> > +            * byteorder on big-endian targets
> > +            */
> > +           writesl(addr, &tmp, 1);
> >     }
> >  }
> >
> > @@ -55,7 +59,11 @@ static inline void i3c_readl_fifo(const void __iomem *addr,
> void *buf,
> >     if (nbytes & 3) {
> >             u32 tmp;
> >
> > -           tmp = readl(addr);
> > +           /*
> > +            * readsl() instead of readl() to keep FIFO
> > +            * byteorder on big-endian targets
> > +            */
> > +           readsl(addr, &tmp, 1);
> >             memcpy(buf + (nbytes & ~3), &tmp, nbytes & 3);
> >     }
> >  }
> Reviewed-by: Jorge Marques <jorge.marques@analog.com>
> > --
> > 2.39.5
> >

This patch fixes the sub-word transfer case on big-endian kernels, but it still does not address the scenario of little-endian kernels accessing big-endian FIFOs.

With the current version, i3c_writel_fifo() and i3c_readl_fifo() only work when the FIFO has the same endianness as the CPU. On platforms such as the ZCU102 (Zynq UltraScale+ MPSoC, Cortex-A53, little-endian), the I3C FIFOs are big-endian, and this patch alone is not sufficient - transfers fail in that configuration.

We have validated this on ZCU102, and the mismatch between LE kernel and BE FIFO is still an issue.

On top of this fix, explicit FIFO endianness support is required, as proposed in [PATCH v7 3/4] "i3c: master: Add endianness support for i3c_readl_fifo() and i3c_writel_fifo()". That approach adds an endian argument and uses writesl_be()/readsl_be() where necessary, e.g.:

static inline void i3c_writel_fifo(void __iomem *addr, const void *buf,
                                   int nbytes, enum i3c_fifo_endian endian)
{
        if (endian)
                writesl_be(addr, buf, nbytes / 4);
        else
                writesl(addr, buf, nbytes / 4);

        if (nbytes & 3) {
                u32 tmp = 0;

                memcpy(&tmp, buf + (nbytes & ~3), nbytes & 3);

                if (endian)
                        writesl_be(addr, &tmp, 1);
                else
                        writesl(addr, &tmp, 1);
        }
}


Thanks,
Manikanta.

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
