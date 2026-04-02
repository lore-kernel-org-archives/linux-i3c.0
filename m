Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9445CC6B1C
	for <linux-i3c@archiver.kernel.org>; Thu,  2 Apr 2026 07:49:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=n2fntRYBYQ8rggdfjFff6t9oYxf3d+L6jU3d6cfmC3Y=; b=Vr+MpghG4o+JN7
	UHtFEpPDmbRfDCFdHsgGdWZGXlnVDXqcoYQnmOgDmuwzWnxfFob0r9yYmFWEEnutOIaKaAEPw3l/Q
	/CrLz30jOT6WmC1plYS7iSOshOrkbwGGFwhxWn4MMfcOGm8HM+AAS3w6setYoS8eOvTzTQddg6SjK
	lmwv2gozun1UFuLGt6p9wAmx0oR0RpUYBkGQZBEIgJNVxOfqIebBbyP7lUxd7wf7l4QbO38OQ7gzl
	LlTbDnDDUaxJ8PZdHv+dLM6KFZg+zOe/ompCbR0h9iqvLv26AtR40m38P6x4+/L0GFt/y8MYfl/wQ
	Z3l3EzvWlVelnFe6hqiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8CoC-0000000H7Q1-1U6a;
	Thu, 02 Apr 2026 07:49:44 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8CoA-0000000H7Pl-2Mt8
	for linux-i3c@bombadil.infradead.org;
	Thu, 02 Apr 2026 07:49:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=MIME-Version:Content-Transfer-Encoding
	:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=SUA6uZc9z/pFXVblr/rO582YZnkUQq8R9EY8kxgyFNY=; b=RAWF+MAVcEo1UY8nEe9U8ciowp
	pEvm/3my8c0dVuhkMZiW6AvIasTNvXOTDUI9AAtRKZPSkeStYvVmfa6mjQ/yRDWV2FQ2mDPqoXr1Q
	UNKxyT5PYenRVyENVqOfX38HMNpRObSwbCsOjqzwC2b548cnaFG5XlxZRJCxG8y35lC12J7DmM1LL
	Mnub8T1/pXs4OFMYMGo4njVqybmlbeH/nwDHQUUivFjQQH1cz3RLBr9eGyHqDWxY1f9WsHUaMxzmh
	oGTKjDz+jN9OHxvLZNmPcHi58stul3wDgAnfFXD1UlDJKTvpg4bzCD4u3cGZb+mgY9CmJXTaiMRqJ
	iu0tahcQ==;
Received: from mail-koreacentralazlp170130006.outbound.protection.outlook.com ([2a01:111:f403:c40f::6] helo=SEYPR02CU001.outbound.protection.outlook.com)
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8Cn0-00000001yUm-285F
	for linux-i3c@lists.infradead.org;
	Thu, 02 Apr 2026 07:48:55 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wHK1SD3gZpaBafj5JhE+iu/AqPPI8mZIFtMpQShKc4urK4gqbloBqVvNUa5cqH6TXwQq+pFmtcHYF4Rn/sbthM80sUiVmsTbKXhxgQisxoTpA4IKY+b73X4WKwFHmPDe2x8yScIlStz+0CL2BeFowSYmykmsNUZ5ldlToSnxsxlJ/6g9aRs4WP5heJDk24RYqe6MXbUOyEoovdcMMgviO3QPPy52haTILmAqXhbapFwjvCN6a924FAdW5iovOW2I/hfSgr+tVKDHy8x7jeb1ODpeKMObOpMEokmwRmzU6v5eXVPJ/8z0gBz5dKxw0L4JVFr6ZfNhrFaCZiB5px4XUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SUA6uZc9z/pFXVblr/rO582YZnkUQq8R9EY8kxgyFNY=;
 b=FS0Wmt6WlT6PAnPCSogpSqrak8SEzfWyi6lKU9VaemNzDQfVhhGUYVJDG/FJC5VikO7VEVeFlwBtTVLCoqlu7dg9RnBB25knmlnqHaBc/4mXK08ntcUH9LC9dy3pmoFiFnYetFff7hGOfuAWqQ9QPj21I7Vo/N+5Fcq4SvIne+P+Rfy4/RdtO0ZNXWVvWSibXjYsKbROOCW4klcXFffKUd3JpjgjcW+7EvRo5/gcjOdAovFFD2S7WqVtiURh2YZk1ob0J/mzJP0KDMB1BtOCze60RRwLMGWD94Y7o76VfdZT+ulJ4/nC8NVzOpKbK6NcrImkJUjQG9QykGcsk/oIvA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=aspeedtech.com; dmarc=pass action=none
 header.from=aspeedtech.com; dkim=pass header.d=aspeedtech.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aspeedtech.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SUA6uZc9z/pFXVblr/rO582YZnkUQq8R9EY8kxgyFNY=;
 b=UCY7E2U3UGTjgCWXMYsKDZV3aXRCTavchO0xRMxHYaWAVfebWOic1Phk8c+tv/cB1Fxccu5vTZShDFRVC71xdc/wHtIVo4i2Kx0lOzgw/GLPV8eFR6wrDuEtAMK6m0hLuu37blUG4TeRSwuKA/wGeyrEdBJnLyXWW3AAlboaJTAueIZ9sAQdoAkqjpNokt4O8DqPaN5eD7PlBXRLuZJfDPvofC/9bPJtqNuXBp5SxgMpu93sEi8geSyh1hgzfUHgb3PU166UIHfreMrI5exK6zOFcrDwhx/tnyc9WkIas+oNKd9JoTcUbv3aDaU+eQ9e3S0IDzCfXq5H5ZuygMQyvA==
Received: from OSQPR06MB7252.apcprd06.prod.outlook.com (2603:1096:604:29c::6)
 by TY2PPF7D00602AD.apcprd06.prod.outlook.com (2603:1096:408::798) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.15; Thu, 2 Apr
 2026 07:46:37 +0000
Received: from OSQPR06MB7252.apcprd06.prod.outlook.com
 ([fe80::92af:c9d9:8779:d19]) by OSQPR06MB7252.apcprd06.prod.outlook.com
 ([fe80::92af:c9d9:8779:d19%4]) with mapi id 15.20.9769.015; Thu, 2 Apr 2026
 07:46:36 +0000
From: Billy Tsai <billy_tsai@aspeedtech.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
CC: Adrian Hunter <adrian.hunter@intel.com>, Frank Li <Frank.li@nxp.com>,
	Nicolas Pitre <npitre@baylibre.com>, Boris Brezillon
	<boris.brezillon@collabora.com>, "linux-i3c@lists.infradead.org"
	<linux-i3c@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] i3c: mipi-i3c-hci: fix atomic updates to RING_OPERATION1
 register
Thread-Topic: [PATCH] i3c: mipi-i3c-hci: fix atomic updates to RING_OPERATION1
 register
Thread-Index: AQHcwQen7pXcASnLYkm67zqKFCJtKbXIu1uAgAD3kESAACN1gIAAAth5gAGFooCAAAciYg==
Date: Thu, 2 Apr 2026 07:46:36 +0000
Message-ID: <OSQPR06MB7252AC77D6E991427E82BB038B51A@OSQPR06MB7252.apcprd06.prod.outlook.com>
References: <20260331-i3c-hci-dma-lock-v1-1-708bc5848381@aspeedtech.com>
 <acvg36HWslcwTFht@lizhi-Precision-Tower-5810>
 <OSQPR06MB725226DC6D102631B4D3E3A28B50A@OSQPR06MB7252.apcprd06.prod.outlook.com>
 <17efbe5d-6f9f-41b6-95ef-7a84e2ed5029@intel.com>
 <OSQPR06MB7252404199BA43EC56B684B48B50A@OSQPR06MB7252.apcprd06.prod.outlook.com>
 <2026040207151741220dbd@mail.local>
In-Reply-To: <2026040207151741220dbd@mail.local>
Accept-Language: en-US, zh-TW
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=aspeedtech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OSQPR06MB7252:EE_|TY2PPF7D00602AD:EE_
x-ms-office365-filtering-correlation-id: 34eb9092-d925-4788-d5d7-08de908bf7ab
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|38070700021|56012099003|22082099003|18002099003;
x-microsoft-antispam-message-info: xVsA4o2B+39ckHSekCHOd+u2K7nCGXakJgG1gIDadR9G1Sfly0IepBDCrp1W+W4zrlyhoI0qXc36jsvaH/PtHJSRfx1qaE0XSAyJVuGhEQttFlr0rj8lQiMKyfwDLGoymkF6wYSf9U7E9ZlRIgTeyfPEL57vu3q2JnEmzz2vpjIuDVwdO/HVTg/xnMLrv/gD1C6Z5AU5Yu+Z87Xp48SVGEhT5ARAYs0F5NQnUkavz+gXkyW1fegIm9YI7oTlvJUWcjjikAUFWoOGn/dfXCv7dJEwRMBNZb95uyD/FcSbDbaSYQ/Vvzn3PBTB4ODrEfcG08mGBegAgiwa+JK9esoqBKxEhG/RFU3+NMeTUliAz2HG8yGClD7mNVQdZmwuaCjrEAJ3eMXSa3i2aAHPUn/lz3KmLK1vz+IrNJQw1Kz8vdbR0bEB4vBZ0VLBcUwox9mgZQKcsmWRySEmwY6XTAwog1KBt/ZxKv7fD5t2SCG16TtSpVbaChk4l5tFNcxMJWAUIKtG2eRqNfV/XTPn0HNXTLHPuM63V3ts1PKdmI2jFAAFjFNk4xjv24miokEayPUpvb/YpZWjNaq/vCNgjQLB0gjD7H4lzh4QEw1YdQPuzzBpyG3MvoCznauL1+dC1ozNmHUtc/npsKa3khEV/XUlP1c5CLa74uX3pA78klbT+PNneimICNkyAD2TCiQuy4rkcXkit4K/u8tdLSiqYEMG8IZ8HoGB43J4CQcu78GH/hnwdNA8G1fqOgi7z6WDQg4fU4kYlSn3LGCLwdpshO1j35mMt9lku/Ktfd3WLX/AiSiBLuNZdR+e1YADbv9b4tFR
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OSQPR06MB7252.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700021)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?1qk/fw/EkdBT6Rgl9iKgoNAl71DjnXPdmCJCL310pP+RcxyX75xLs7Qc2x?=
 =?iso-8859-1?Q?GP0HRrqKcqag6f8IahOU6IiepqAiID0qkx/MyX5ICq7n1qAscCE15vOlp6?=
 =?iso-8859-1?Q?X/ScABC0zei+BXIES6GmuHijA2Y0l+6rPqBIK+K8bvbMjCtWY1Cad/jHiy?=
 =?iso-8859-1?Q?MBAGgtcSOrPfa6hf4pEUZg+rD5FV7av6+MSBSu/GXhShNLTbwDuH4LREcn?=
 =?iso-8859-1?Q?NvvXYNt9U2AOdHSlu+oI9J1CkJlOAFYusJCK5FnKfdg/LzJ6u41jkM3o2n?=
 =?iso-8859-1?Q?WIs021Djekk1bUkuHChfanBiGKANOzAmWbQRBCmxGoTU7a5jiVomecjyl2?=
 =?iso-8859-1?Q?yY+y/BLhlGn32nWYYkovhQkep7tdIbmSwvaAyQMRS68No31AqN6BKQbXRC?=
 =?iso-8859-1?Q?DAN2e/TDobXAeFhbYGM1OXDeoqcMAmaG1jWAxW+iOKRC3Rh9ZbLIk4aYM7?=
 =?iso-8859-1?Q?nDlzLp8bP6n2GcLAyfS79oZiTM2KTYdCoCXj382Hh1bYjbMSY27gSV6My3?=
 =?iso-8859-1?Q?1+shaivcvaR/Wxl0X/CFLJ+JgIYSh0qzWu6s9dpbB+BgJJUArgH+hZPl6a?=
 =?iso-8859-1?Q?eoajnMi7Ygm6Ca7Mvhoq7nPnlvRjHFH9Pl05HvLj2A93O6Wm0nJPsW4ID9?=
 =?iso-8859-1?Q?hBdKKveBxbaVrmq2FdT11Z/9JE63FeqRjA1U7NtjqwU9FViYU8VaXEdBC/?=
 =?iso-8859-1?Q?2SmtsGGLfVPPYg3BA5glDxY3JEjc4kPxQ33y3rCxTIcrewQjtFvF8lRJ6D?=
 =?iso-8859-1?Q?w4i5uxxjwpWOoGFtRR4+DVRh3GoR9qJlrmBeqkDoZ5E2qMpDcCawN/463M?=
 =?iso-8859-1?Q?4uv0cxlFFWaTzMMSBaMpAR6ZItkUmR3QHC/GOM6uzaEOSI7yEZnaJEmFwe?=
 =?iso-8859-1?Q?fECc37wniI1kWzZkhMiacQn34TYnnDbKAX+lC41rYYCFwglCQmzVELIPrU?=
 =?iso-8859-1?Q?kFiF2bLi0d7Lllb6hv4gn1I+mfEaVFtsJMVkhW7qlP2YdoetydNd2yDqyl?=
 =?iso-8859-1?Q?TxhnXrBgZRFfQUeGYsPh4QRvEGoFpdqBs8hYiJpE9E0ykTbSWr0GfI8M5O?=
 =?iso-8859-1?Q?FjAqbggW048vupa4hcPRi0TRa1HtlvxjiCeYglb2X0SRZPlmYZBzHKcmcT?=
 =?iso-8859-1?Q?vLDiIBgJPfD4/kaOioqqtRJMm2LjS0CHStzu/OAAxFUl1xvNH0yrSo86HN?=
 =?iso-8859-1?Q?jzavY5sRbmmBztWKuE7bdAPcGzUI0hEoC+9D7SWIw4umXNb77kyXoHgjKD?=
 =?iso-8859-1?Q?1QaCEY6Y+PB39AcUCZr7WIvyNDKD4fR7xQskKLgycKXtPBlpHgyNvDqUyT?=
 =?iso-8859-1?Q?bzmtihK/VXsxF8dG7ud8S1w+2oPk+q4prIvwzfq9BRjBgKV/7Th+4uMDKk?=
 =?iso-8859-1?Q?DmKpmQ9uF/6NfrgkHSaU2psTcFqQVggOxWBiCr4jMWfoaibeM6alELt+K2?=
 =?iso-8859-1?Q?apVB8alPWRCnd47qCB6tnE04wpoW8JBt6tranqol7GVQ9e4wfoSZRxEgwN?=
 =?iso-8859-1?Q?3wbResPVvRANqPIOrNEvf4zW19OGjBY/4lULlRJQjMvTSUyMW10xzyxvIi?=
 =?iso-8859-1?Q?aJ62S8zm4Q+QHdP/VyzQDYZnu3eVRMLtazb08WfP4+Z7TWweWynv6EwLPm?=
 =?iso-8859-1?Q?8wJwK9BsyNquklPOAMUbo614llcSxONVxBxOebDnIlS+qnUzS7FTTXRY5h?=
 =?iso-8859-1?Q?YmiY5xNTzORFhgSGeIcGyN6jK8O9EHRADROFU3iT6Djo+37MI9MJGMy/gQ?=
 =?iso-8859-1?Q?iC6pPpLtw5cPZrZx8KC71FPqaPqr9/ezORcNw/YIdTAfC4+IPAc+G/IvJ5?=
 =?iso-8859-1?Q?2ibK3x3MaQ=3D=3D?=
MIME-Version: 1.0
X-OriginatorOrg: aspeedtech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OSQPR06MB7252.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 34eb9092-d925-4788-d5d7-08de908bf7ab
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Apr 2026 07:46:36.2390
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43d4aa98-e35b-4575-8939-080e90d5a249
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: bDhHLeRaXknEtbJ+jq96pcKt3WxkEJBHodbjLvBtY/v0HayhjsvDLY8ewFOGXRLw9HQuFILF7i7W5A6T8RTsRzy06m5lH0FWCCUE6pdhlt4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY2PPF7D00602AD
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260402_084852_897399_05BB0BA6 
X-CRM114-Status: UNSURE (   9.41  )
X-CRM114-Notice: Please train this message.
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

On 01/04/2026 08:04:45+0000, Billy Tsai wrote:
> > Hi Adrian,
> >
> > Thank you for the clarification. I overlooked the lock in i3c_hci_irq_handler() in core.c.

> Just to be clear, did you use AI to find the issue ?

We have encountered a similar issue before, but addressed it using a different approach:
https://github.com/AspeedTech-BMC/linux/commit/aaf426c3d00ca06a5c0bd3667591ab579896726e
https://github.com/AspeedTech-BMC/linux/commit/a9428fffc7e64242b880ceee5443d094bc6cae14

For the upstream version, I noticed that you have also added fixes for this issue. I used
an AI tool to review and compare your solution with ours, and it highlighted the 
differences in this patch.

Thanks
-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
