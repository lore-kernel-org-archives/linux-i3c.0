Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 659E0C43458
	for <linux-i3c@archiver.kernel.org>; Wed,  1 Jul 2026 09:52:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xBCppQryvHT0CFfdteS6pCSkfbG7jzBDuzdG2bjqu6Y=; b=0Ey6ocE5TbHKij
	s1VkUWDsZjVn3Fjp7i1k/wBrhm9MzNV9fb5x9cuD7OeDOH5qi1do8SG9BHHXfl2hkFpVNXoeBZj8p
	bKgjxnm7qiiHAhpsH/trMYHpf5BkgaH5wWg74ZZywtaDfyXEW6YL9ocRA3qZmjhLWzqwDvmPWHGZr
	1lTatKmOVcxkXgl8PdcmsXL9s8O1XZEp52ZQPZyXM/a9p8kSdk2Sgf07dxzjInOBMjMU25CSuBK/7
	NXdD+We1wtPg+BS6J0IncBITI8BovSQhWUvitSQ7VLwhQb7Zry55MJuiMjO4+kL5xNFnEAJcL+Xzs
	Zk6n7v0A+hhM+jQ82Vrg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1werc9-00000001F1h-0b0v;
	Wed, 01 Jul 2026 09:52:17 +0000
Received: from mail-westcentralusazlp170100005.outbound.protection.outlook.com ([2a01:111:f403:c112::5] helo=CY7PR03CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1werc3-00000001F0a-0jfz
	for linux-i3c@lists.infradead.org;
	Wed, 01 Jul 2026 09:52:16 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DOa/nszj5xh80oc5lAGaL6/68uVUi8DQvE+4yZ+WUNkGZu/naJO0T8Nd9tnoPO3gp8dhVqumk+mU7qIJKZflYuX/Rl8V1OcGXNXtIgb3PW7aPOXbrs++YfKcNVt67Pv3FjkaYyOO3mflvxMGWsqgqv6AhLAkb8DJ3OZbASl4mgCb63zxY0SWHji1Jp3GZzUh6Y0S7PoFIdirD6VwbEDKIRFtEq3lxruVAPZGi6nkzXZUe9x3V8LlvOIdtv+4qNz9wWDmB6ydHmooaLfVq64ZsXlXqJkio/E1617RTxV/mq6WnyI9AFyPlPCPJwUtr00gN3cOryoIsJJ/P92mvKqzQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=C/wr3CCcjP+ceUdn2Qi5N5hwrWhObGaBpLsLafXcdcA=;
 b=j8gncc7MDoFZquyof1s/unxW/EuY+v3yf1+sQ8LMlH6F6+Ypbz0B2whR3FkCEQDfk9jNIoji4zAbrsmiNNQpI936JtBwuwM3feKHiC7XVebEr6QRWrVsNgsJap1765BigaocWFwThAOPfQtXCd0f3pooy8kJ004d0Ifuwu9AWknNOGSk5rn7+3pST2x1qhzTgk4EQpiN33VnU9TvyDt/3GoJGNuxknNCWDJw6PpCI5KD19MV9Lj0yIefVocYHnv6NDXgatr5lPbW/hxVjUTgEOwjBSC1fHfM7pgNCCv62yR4kbYQ9gDf4huSeXocgdQYd5af3aZioUiKcit3ZxHcpg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=C/wr3CCcjP+ceUdn2Qi5N5hwrWhObGaBpLsLafXcdcA=;
 b=bNrSdDzM3CMQgqq9NdV8R3tbsYeeYIvegAJVDr2dPuVP/IntMMw/FaIeIEVAJ+siC7co/2bOKRC0vlMioztDWvsggdwzp9fqg0Oba5KiNkjyxGSrFITlQy1pNFsrtY4fQIrvNKKPSEOd/mD/95RPc96x0JhiMwwZ5pbijN6Npe4=
Received: from IA1PR12MB8408.namprd12.prod.outlook.com (2603:10b6:208:3db::13)
 by MW4PR12MB6852.namprd12.prod.outlook.com (2603:10b6:303:207::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.8; Wed, 1 Jul 2026
 09:52:04 +0000
Received: from IA1PR12MB8408.namprd12.prod.outlook.com
 ([fe80::10cf:64f0:2de6:e466]) by IA1PR12MB8408.namprd12.prod.outlook.com
 ([fe80::10cf:64f0:2de6:e466%4]) with mapi id 15.21.0181.008; Wed, 1 Jul 2026
 09:52:04 +0000
From: "Patil, Shubham Sanjay" <ShubhamSanjay.Patil@amd.com>
To: Frank Li <Frank.li@oss.nxp.com>
CC: "git (AMD-Xilinx)" <git@amd.com>, "Simek, Michal" <michal.simek@amd.com>,
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
	"linux-hardening@vger.kernel.org" <linux-hardening@vger.kernel.org>, "Pandey,
 Radhey Shyam" <radhey.shyam.pandey@amd.com>, "Goud, Srinivas"
	<srinivas.goud@amd.com>, "Datta, Shubhrajyoti" <shubhrajyoti.datta@amd.com>
Subject: RE: [PATCH v9 2/2] i3c: master: Add driver for AMD AXI I3C master
 controller
Thread-Topic: [PATCH v9 2/2] i3c: master: Add driver for AMD AXI I3C master
 controller
Thread-Index: AQHdAwXfuvPUr7Uz5EiD773ySV5kzLZMWXSAgAwc1EA=
Date: Wed, 1 Jul 2026 09:52:04 +0000
Message-ID: <IA1PR12MB8408F56FCD4FD4E373EA6355F5F62@IA1PR12MB8408.namprd12.prod.outlook.com>
References: <20260623114417.2578189-1-shubhamsanjay.patil@amd.com>
 <20260623114417.2578189-3-shubhamsanjay.patil@amd.com>
 <ajq4P8G1BXaJ0jDu@lizhi-Precision-Tower-5810>
In-Reply-To: <ajq4P8G1BXaJ0jDu@lizhi-Precision-Tower-5810>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_198e8dea-a4f3-4850-b16a-fd6d2b1302b4_Enabled=True;MSIP_Label_198e8dea-a4f3-4850-b16a-fd6d2b1302b4_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;MSIP_Label_198e8dea-a4f3-4850-b16a-fd6d2b1302b4_SetDate=2026-07-01T09:44:08.0000000Z;MSIP_Label_198e8dea-a4f3-4850-b16a-fd6d2b1302b4_Name=AMD
 General
 v26;MSIP_Label_198e8dea-a4f3-4850-b16a-fd6d2b1302b4_ContentBits=3;MSIP_Label_198e8dea-a4f3-4850-b16a-fd6d2b1302b4_Method=Standard
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA1PR12MB8408:EE_|MW4PR12MB6852:EE_
x-ms-office365-filtering-correlation-id: 45684456-d7a7-4650-37b6-08ded75667c2
x-ld-processed: 3dd8961f-e488-4e60-8e11-a82d994e183d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|7416014|376014|23010399003|13003099007|38070700021|3023799007|56012099006|11063799006|4143699003|18002099003|22082099003;
x-microsoft-antispam-message-info: ZlKb/WxKZrhrsUX86txa4RtqnAJ4j8RQm0lUmgwTKLUSXtBlNAWIlZMOJNkWTkhWtzimjKIPKVKn2Wdu7QxZv5Hp5dL9WmCO/Gg6BcU9oJibb3o5YXNelvQ5G7nNGWZIZleOF5N6tXNBWQe6KvHnaEvO+5aKrvxSrpPfwHs2AnNxfurIy5cOzKHydOrHvTktIFZoKDyuArR/Pqug59CXJaJrtAoA68hdQzWgVrwKJujIwoqpXwfOyuVN+1uBVl2siPd0wKBd1/2KhDTP1AqZEjtIsm2AxC7cUBYwoZ3tXFoFDOouCCbObeorZOPcRdmX7nqm5vqwA0o4toKzRLAu9/dFUPJTNG3bNb8fUMkb/wxIWQHxVhzwMmU6aRjyaukI6c4z7LOB4On8dsgeaunp1U54LI/8GGjMue80RldPiY17Ze9gtjmx9jAnnDtGGtX8a3qMhmesWwl804RYNqR9DI2FbI0HW3a4COq+YHYg/q7HeRyk1EDV5HPQiEq6YaBLznkHhv8fkynj/fNnNktKRU6GocbyTYLrsCSDSBnuQkekzaEXDEX5DkXzo6NPMrAvUo4ZZ7BhqKj1fYgCz0feEMFw3uVxA0cCcttQcrvUZyqVen3LYqmVD4NIKFRaOyC1EvwbLIM0NoyiRrOQRh7w98p1f4LdwblXz6CM16PucJRtsCkzQPDM3Y3IH08wlaRlSgLFmAFaI9r4qABamtr3MyneQbwlRthFsWfMfuPw7vA=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA1PR12MB8408.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014)(23010399003)(13003099007)(38070700021)(3023799007)(56012099006)(11063799006)(4143699003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?SE17zsXidYFoUTixGg9bawZdH3jVHOgpA4yJ157wlxQAFPOk+7AujxSVi9ot?=
 =?us-ascii?Q?GPsa2+0pQR90FVKMzAG0ljXQDwYhlCBBwrB4xvwovZVanALcSMDwZTMqP+vm?=
 =?us-ascii?Q?3zrJbCybFLQkCHe0JPWVYHigMLphXwZTUELWStyF5Ph2ZeKDY6yHnWR5Jqhg?=
 =?us-ascii?Q?kQLsDUDhUWZlEKR5orPqVBQMQwjiJJZ3Ds1yv7t/qoZdTyyflUyPbaNNyzzu?=
 =?us-ascii?Q?us6dIroAJ8f4JVp2TsjBttWKaO2Yf3lUn4krsPjMxBsnsiMo7U9Ob/5nDhB4?=
 =?us-ascii?Q?D2qrZm7iFzUmnmbJyyALhOXp7q+LJFQYIxbF3CoacwC6b3+8uo15iINmS1Nn?=
 =?us-ascii?Q?Bppt21z8P9JZbKmnwSxW0fN9ow3OXDpV2WC7mwXhXvcoR6Nad2nQp9JnqMOe?=
 =?us-ascii?Q?VT3ymJfvQHaBGvU8mwxcz4ZNUbe3w6FwT52KrEAww+v3yGi4Ace7gUikzb/v?=
 =?us-ascii?Q?W6PPVFapyYgWFYbQzGAqK1tiG+VPQeT7KNw4DT//F21tFVUTFfoTmovlstOm?=
 =?us-ascii?Q?sSsjoVeCoD2CnNqF69CEMQaJaGlzchDawjjCrfGKN+dpEAD32QRQBRv7i6Dd?=
 =?us-ascii?Q?JNEaL50mHU+eTXd912a3wIVpRlqGLCX5+VDQLfC7JUoqQea6qM1Ka205l14U?=
 =?us-ascii?Q?cpAwHduCNVDjqV2PTT+Iemi4qGWDSVLQ5g1sJvHcj2lVfSeNI/h0C99TcML+?=
 =?us-ascii?Q?k+lwjTewbiKlCNCFuFDeVWWhLFE/P/Df8CkbFMzOl8F7mir5wIHeW9/4bbcO?=
 =?us-ascii?Q?EAM6f/qO24nnfvG8bhHsrWvfOqES6/jK3ib2JS6vIVhuiSDMAGvDvHIV99qA?=
 =?us-ascii?Q?PnXeS7TPC4+avhp+Ll5RpJ3pMqtOQzCeuYbeAs1jrWQZtOq99E/m9Ye6VQwT?=
 =?us-ascii?Q?T+t3HsTagJfkG3pEyM54u46Z+Oj/marYGn+THUE6mxAEg3GC2n1yKGKt7amD?=
 =?us-ascii?Q?vzDbkndeuqilVI/pECChnrH0zANn1ax4yppfze/KISoWyTReBm6H8hH26GuU?=
 =?us-ascii?Q?rbMQPsF1QdcbDcMfaWLY9Bfb1nDEEiehvYGZfw+HBivsGcFDGIh7NpcErzYz?=
 =?us-ascii?Q?blTXGJks9jVMGMUoH7d8tupfWJ6DGxtaoMUO0ItldY6BogqdH1f9xsNufz2h?=
 =?us-ascii?Q?xbhG38afIrcrT7ePbdlp91B2O0D42x4rInsWZaRx2WSPj7pcsiAi7hGVC3CE?=
 =?us-ascii?Q?jRjkQa2zdgFsdH0svS+9UmKRiZHi5Jfpw3RHeFLxjE8qzfL4w2DtHjh1zUVD?=
 =?us-ascii?Q?pfCShATG0pNhk4JyjpFzcxNFoL6B2xFiFRi8zZ7pPulNX/6IzhRVUV2dlO8L?=
 =?us-ascii?Q?348fL4igfXv0mj7py0i5VM/HPvLV9Vvnz7JtmMdHR4K1FUvca5EAWf78kQaW?=
 =?us-ascii?Q?mD/rIkJYHhjaSGE+ZeYx31ArEUY854i10avhI0FwhKLhg3+K7zzahFsrLZz2?=
 =?us-ascii?Q?FMlC7pq7GhpUeXPawwpseWIzuZonSjo8Bo/T7uQjPv3MZMh1mwnDwKz78KQn?=
 =?us-ascii?Q?JNzL5mw4XOWxLdCCi/md1MeEgBRgIM9coA4bJ7bPHfe03M3CTYbuQxKuuTxu?=
 =?us-ascii?Q?HhA28vh2qJQAIrJAm36/sgMfGdMfFyrx6bdP/++XJJQY5MPOH7Avp4fD7KT4?=
 =?us-ascii?Q?XTF0Am3QLpJ/On5q7rF2jjOFDQWQZ10j66ifPe0GvH6dKU+zatw2kKFlHzKW?=
 =?us-ascii?Q?aJLu+EFcSttdRnKbVnuKs0OODNH0nN/hM2fqpIJXDGtqYdQ4?=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA1PR12MB8408.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 45684456-d7a7-4650-37b6-08ded75667c2
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Jul 2026 09:52:04.0852
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ZAoRfP60J/QrGaw6+SPASfcRA6wpdYtG6pdcOX9dHzCrgz7gPK0TjQXJRSAalCiD6oO4sfX6abb3UqE941nuJA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB6852
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260701_025211_292567_83A8DD2B 
X-CRM114-Status: GOOD (  22.50  )
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

Hi Frank,
Thanks for the review. Responses inline; all the mechanical points are addressed in v10.

> > +#define XI3C_OD_TLOW_NS                      500000
> > +#define XI3C_OD_THIGH_NS                     41000
> > +#define XI3C_I2C_TCASMIN_NS                  600000
> > +#define XI3C_TCASMIN_NS                      260000
[...]
> > +#define XI3C_THOLD_MIN_REV0                  5
> > +#define XI3C_THOLD_MIN_REV1                  6
> > +#define XI3C_CYCLE_ADJUST                    2
> > +#define XI3C_FIFO_RESET_DELAY_US             10
> > +#define XI3C_POLL_INTERVAL_US                10
>
> Can you provide comment where these value come from, spec, datasheet ...?

Sources are now cited in the comments (MIPI I3C v1.1.1 tables and the AMD PG439 register sections/table numbers)
PG439: https://docs.amd.com/r/en-US/pg439-axi-i3c/Introduction

> > +             ret = i3c_master_add_i3c_dev_locked(m, master->daa.addrs[i]);
> > +             if (ret)
> > +                     goto err_daa;
>
> https://lore.kernel.org/linux-i3c/20260608054312.10604-7-adrian.hunter@intel.com/T/#u
> which defer add i3c device.

> And don't check error here, because one device add failure should not
> impact other following devices.

Agreed. The driver now just calls i3c_master_add_i3c_dev_locked() without checking its return, so one device's failure can't block the others. The registration deferral itself is handled by the core (Adrian Hunter's series); the driver doesn't register devices inline, so no driver-side change is needed beyond dropping the error check.

> > +     while (cmd->rx_len > 0 && !xi3c_is_resp_available(master)) {
> > +             ...
> > +             xi3c_master_rd_from_rx_fifo(master, cmd);
> > +             usleep_range(...);
> > +     }
>
> can you use read_poll_timeout macro?

This loop isn't really a poll, so read_poll_timeout() doesn't map cleanly onto it. The loop body has a side effect rather than reading a status value: xi3c_master_rd_from_rx_fifo() drains the RX FIFO into the caller's buffer on every iteration (advancing rx_buf, decrementing rx_len). The exit condition is also compound - we stop when either the buffer is satisfied or a response word arrives - and there's a mandatory final drain after the loop to pull out any bytes left in the FIFO once the response shows up. Expressing that with read_poll_timeout()'s op/val/cond model would force the drain helper to return a value just to satisfy the macro, which reads worse than the explicit loop.

The genuine poll just above this - waiting for the first RD_FIFO_NOT_EMPTY / RESP_NOT_EMPTY - already uses readl_poll_timeout(). I'd prefer to keep the data-draining loop explicit, but I'm happy to revisit if you see a clean way to fit it to the macro.

wwr,
Shubham

-----Original Message-----
From: Frank Li <Frank.li@oss.nxp.com>
Sent: Tuesday, June 23, 2026 10:16 PM
To: Patil, Shubham Sanjay <ShubhamSanjay.Patil@amd.com>
Cc: git (AMD-Xilinx) <git@amd.com>; Simek, Michal <michal.simek@amd.com>; alexandre.belloni@bootlin.com; Frank.Li@nxp.com; robh@kernel.org; krzk+dt@kernel.org; conor+dt@kernel.org; pgaj@cadence.com; wsa+renesas@sang-engineering.com; tommaso.merciai.xr@bp.renesas.com; arnd@arndb.de; quic_msavaliy@quicinc.com; S-k, Shyam-sundar <Shyam-sundar.S-k@amd.com>; sakari.ailus@linux.intel.com; billy_tsai@aspeedtech.com; kees@kernel.org; gustavoars@kernel.org; jarkko.nikula@linux.intel.com; jorge.marques@analog.com; linux-i3c@lists.infradead.org; devicetree@vger.kernel.org; linux-kernel@vger.kernel.org; linux-arch@vger.kernel.org; linux-hardening@vger.kernel.org; Pandey, Radhey Shyam <radhey.shyam.pandey@amd.com>; Goud, Srinivas <srinivas.goud@amd.com>; Datta, Shubhrajyoti <shubhrajyoti.datta@amd.com>; Guntupalli, Manikanta <manikanta.guntupalli@amd.com>
Subject: Re: [PATCH v9 2/2] i3c: master: Add driver for AMD AXI I3C master controller

Caution: This message originated from an External Source. Use proper caution when opening attachments, clicking links, or responding.


On Tue, Jun 23, 2026 at 05:14:16PM +0530, Shubham Patil wrote:
> From: Manikanta Guntupalli <manikanta.guntupalli@amd.com>
>
> Add an I3C master driver and maintainers fragment for the AMD I3C bus
> controller.
>
> The driver currently supports the I3C bus operating in SDR mode, with
> features including Dynamic Address Assignment, private data transfers,
> and CCC transfers in both broadcast and direct modes. It also supports
> operation in I2C mode.
>
> The controller's data FIFOs are accessed big-endian; the driver
> performs this conversion locally using ioread32be()/iowrite32be() with
> the helpers, so it does not depend on any core FIFO-endianness helpers.
>
> Signed-off-by: Manikanta Guntupalli <manikanta.guntupalli@amd.com>
> Co-developed-by: Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>
> Signed-off-by: Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>
> Co-developed-by: Shubham Patil <shubhamsanjay.patil@amd.com>
> Signed-off-by: Shubham Patil <shubhamsanjay.patil@amd.com>
> ---
...
> +#define XI3C_REV_NUM_MASK                    GENMASK(15, 8)
> +#define XI3C_PID1_MASK                               GENMASK(15, 0)
> +#define XI3C_FIFO_LEVEL_MASK                 GENMASK(15, 0)
> +#define XI3C_RESP_CODE_MASK                  GENMASK(8, 5)
> +#define XI3C_RESP_CODE_SUCCESS                       0       /* Transfer completed OK */
> +#define XI3C_RESP_CODE_NO_TARGET             2       /* 7E NACK: no target on bus */
> +#define XI3C_RESP_CODE_NACK                  3       /* Target NACK / CE2 / DAA end */
> +#define XI3C_ADDR_MASK                               GENMASK(6, 0)
> +#define XI3C_FIFOS_RST_MASK                  GENMASK(4, 1)
> +
> +/* Command FIFO word layout (bit ranges encoded in the GENMASK/BIT args) */
> +#define XI3C_CMD_TYPE                                GENMASK(3, 0)   /* command type */
> +#define XI3C_CMD_TERMINATE                   BIT(4)          /* terminate (last cmd of xfer) */
> +#define XI3C_CMD_ADDR                                GENMASK(15, 8)  /* target address << 1 | RnW */
> +#define XI3C_CMD_LEN                         GENMASK(27, 16) /* payload length in bytes */
> +#define XI3C_CMD_TID                         GENMASK(31, 28) /* transfer ID */
> +
> +#define XI3C_OD_TLOW_NS                              500000
> +#define XI3C_OD_THIGH_NS                     41000
> +#define XI3C_I2C_TCASMIN_NS                  600000
> +#define XI3C_TCASMIN_NS                              260000
> +#define XI3C_MAXDATA_LENGTH                  4095
> +#define XI3C_MAX_DEVS                                32
> +#define XI3C_DAA_SLAVEINFO_READ_BYTECOUNT    8
> +
> +#define XI3C_THOLD_MIN_REV0                  5       /* Min SDA hold cycles, rev 0 IP */
> +#define XI3C_THOLD_MIN_REV1                  6       /* Min SDA hold cycles, rev >= 1 IP */
> +#define XI3C_CYCLE_ADJUST                    2       /* SCL/SDA pre-bias for HW pipeline */
> +#define XI3C_FIFO_RESET_DELAY_US             10      /* HW settling time after FIFO reset */
> +#define XI3C_POLL_INTERVAL_US                        10      /* readl_poll_timeout() sleep slice */

Can you provide comment where these value come from, spec, datasheet ...?

> +
> +#define XI3C_I2C_MODE                                0
> +#define XI3C_I2C_TID                         0
> +#define XI3C_SDR_MODE                                1
> +#define XI3C_SDR_TID                         1
> +
> +#define XI3C_WORD_LEN                                4
> +
> +/*
> + * XI3C_RESP_TIMEOUT_US is in microseconds because it is passed as
> +the
> + * timeout_us argument of readl_poll_timeout(). XI3C_XFER_TIMEOUT_MS
> +is in
> + * milliseconds because it feeds msecs_to_jiffies(). Keep the two
> +units
> + * distinct in the names so callers cannot mix them up.
> + */
> +#define XI3C_RESP_TIMEOUT_US                 500000
> +#define XI3C_XFER_TIMEOUT_MS                 1000

the same here.

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
...
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

now suggest use fsleep()

> +
> +     /* De-assert FIFO reset, then wait for the FIFOs to come back up. */
> +     data &= ~XI3C_FIFOS_RST_MASK;
> +     iowrite32(data, master->membase + XI3C_RESET_OFFSET);
> +     ioread32(master->membase + XI3C_RESET_OFFSET);
> +     udelay(XI3C_FIFO_RESET_DELAY_US); }
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

ues new API,  kzalloc_flex()

> +     if (!xfer)
> +             return NULL;
> +
> +     xfer->ncmds = ncmds;
> +
> +     return xfer;
> +}
> +
> +static void xi3c_master_rd_from_rx_fifo(struct xi3c_master *master,
> +                                     struct xi3c_cmd *cmd) {
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

now need't min_t, just min

> +     xi3c_readl_fifo(master->membase + XI3C_RD_FIFO_OFFSET,
> +                     (u8 *)cmd->rx_buf, copy_len);
> +
> +     cmd->rx_buf = (u8 *)cmd->rx_buf + copy_len;
> +     cmd->rx_len -= copy_len;
> +}
> +
...
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
> +             usleep_range(XI3C_POLL_INTERVAL_US, 2 * XI3C_POLL_INTERVAL_US);
> +     }

can you use read_poll_timeout macro?

> +
> +     /* Read remaining data */
> +     xi3c_master_rd_from_rx_fifo(master, cmd);
> +
> +     return 0;
> +}
> +
...
> +
> +     for (i = 0; i < master->daa.index; i++) {
> +             u64 pid;
> +
> +             ret = i3c_master_add_i3c_dev_locked(m, master->daa.addrs[i]);
> +             if (ret)
> +                     goto err_daa;


https://lore.kernel.org/linux-i3c/20260608054312.10604-7-adrian.hunter@intel.com/T/#u
which defer add i3c device.

And don't check error here, because one device add failure should not impact other following devices.

Frank
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
...
> +static int xi3c_master_send_bdcast_ccc_cmd(struct xi3c_master *master,
> +                                        struct i3c_ccc_cmd *ccc) {
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

kmalloc_obj

Frank
> +     if (!buf)
> +             return -ENOMEM;
> +
> +     buf[0] = ccc->id;
> +     memcpy(&buf[1], ccc->dests[0].payload.data,
> + ccc->dests[0].payload.len);
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

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
