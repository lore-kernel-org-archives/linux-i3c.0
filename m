Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E34FCAC5A1
	for <linux-i3c@archiver.kernel.org>; Sun, 14 Sep 2025 20:33:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WL6OtXD6kpRxUluWwBPZ4EyAXRFg/h/uO3ax9vKDON0=; b=taKoSIpMTPlCY7
	DvcGGKT5tL1pzNgB3O+VES0iZ7nRKe6+s7pQLD+zu/lQKZJ2P2wXBD+USd/xgZKF9GJur0bry713L
	5KaVsuPsFP87xafALa8LB3kQ+H8LDrDp47W3tQ/OjUDzmZQQgQceOTiVHF+VvgT+iHBLFyuslNQxU
	tmouvPzBTvGarflVogvtybfZbdDAb4vhL982z7awFEhP0vn+jIzLlIWS0eQCMmNhCiaeDF2juFKmo
	AVWrRyWjLJS9HhxSgZd+4mzAA1ZyWubwl583SMbUgpGNyTOlw8Nl5s+0LMaRDuNCh1Fw0Ew1rRqf9
	CaecuFWHjiYtGUB4XpOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uxtPn-00000002A5Z-32zF;
	Sun, 14 Sep 2025 20:33:39 +0000
Received: from mail-dm6nam10on20623.outbound.protection.outlook.com ([2a01:111:f403:2413::623] helo=NAM10-DM6-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwxg9-00000007VQ4-2F3a
	for linux-i3c@lists.infradead.org;
	Fri, 12 Sep 2025 06:54:43 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fQFdQYZDzZfa05nT+EAloSwLFiXUTTRQRfdT2U7kBWVsYZbW6ylT3U0mexwoVK8WwmeY6spQWdw43ghb/xvmxwHugWlPv0xvV1eBQ/7I5TqKelHHKg9DU0siDWcLIpZ+52I9ybJvYRxEOPbhWxe7wC7/p508oL411tYTdyW+XtFyXEzqSFb59z2NlsSw4KGaYJHoZwfN5cEhzDRNcpF+Bln3I4l1OsvxCPjksDmOUNFQhp2BhX75CIqNUCGZCKn4Wp56h7o/Jy7MNSCfEoW3pbsDX2QCj+KN/NzVZx7mjow1D+FhLNygNA/NY6KOpjfQ6ov9Lr8HNonQue7QVDhStA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=l9E6NA3C5SEcB6YsGQyTXNvPuTxKgL9XIG3j21wgRRc=;
 b=vFBowQ4NS6fs+fXxQePrWaSggdnpn93DMWU1kd4HIKEtTcYR+zZx+s7cqUk/L58HkHdz1QCwYNxzvUglVZ8zgsYkh/8Na/jC4AeMdx3W4loSNd37PKilXxlTdlK/JKPGaxkK/plrtZcRKqP65SLYAbUfp7q0YCqHXKQBK7C1UeVE6ueuJiumcnexJmFNyuKnFFdH4vjWN19Z9Euc+pjrGiENiRwnNJF3mTA/vLI9e7w99+lnXBBGX7fEtCe0cvTZU2hW1JEYkupGfJ2SmHNfI0wVTaFvPhsmIEfswvYiFkN+VpKOnJWfWZ1qqOGMVg51roBg3ZBUyoUzctv7A1aKnw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=l9E6NA3C5SEcB6YsGQyTXNvPuTxKgL9XIG3j21wgRRc=;
 b=bR9I9iLf5pB1Sj00uvjG04RWBwZsal/GK5DRDKc5idsyPJupasGHQQ3PIzh66dkoNGw/1j9U8MAUmMSO8MnWtT0T1RGepQxo6yhzZubUBs2RkDT/sSEMvZ2xuFS3rxL7/67GkzSRPA8W95qczfc86Am3PLoomJLlRRtIdOt0Q5A=
Received: from DM4PR12MB6109.namprd12.prod.outlook.com (2603:10b6:8:ae::11) by
 SN7PR12MB7372.namprd12.prod.outlook.com (2603:10b6:806:29b::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.22; Fri, 12 Sep
 2025 06:54:32 +0000
Received: from DM4PR12MB6109.namprd12.prod.outlook.com
 ([fe80::680c:3105:babe:b7e1]) by DM4PR12MB6109.namprd12.prod.outlook.com
 ([fe80::680c:3105:babe:b7e1%4]) with mapi id 15.20.9094.021; Fri, 12 Sep 2025
 06:54:32 +0000
From: "Guntupalli, Manikanta" <manikanta.guntupalli@amd.com>
To: "git (AMD-Xilinx)" <git@amd.com>, "alexandre.belloni@bootlin.com"
	<alexandre.belloni@bootlin.com>, "Frank.Li@nxp.com" <Frank.Li@nxp.com>,
	"wsa+renesas@sang-engineering.com" <wsa+renesas@sang-engineering.com>,
	"quic_msavaliy@quicinc.com" <quic_msavaliy@quicinc.com>, "S-k, Shyam-sundar"
	<Shyam-sundar.S-k@amd.com>, "xiaopei01@kylinos.cn" <xiaopei01@kylinos.cn>,
	"billy_tsai@aspeedtech.com" <billy_tsai@aspeedtech.com>,
	"linux-i3c@lists.infradead.org" <linux-i3c@lists.infradead.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
CC: "Simek, Michal" <michal.simek@amd.com>, "Pandey, Radhey Shyam"
	<radhey.shyam.pandey@amd.com>, "Goud, Srinivas" <srinivas.goud@amd.com>,
	"Datta, Shubhrajyoti" <shubhrajyoti.datta@amd.com>, "manion05gk@gmail.com"
	<manion05gk@gmail.com>
Subject: RE: [PATCH V2] i3c: dw: Add shutdown support to dw_i3c_master driver
Thread-Topic: [PATCH V2] i3c: dw: Add shutdown support to dw_i3c_master driver
Thread-Index: AQHcAWRgHgzNuWUIgkCsDHVkviqO2LR+JTFAgBE750A=
Date: Fri, 12 Sep 2025 06:54:32 +0000
Message-ID: <DM4PR12MB610914E1B473AB7D4840103B8C08A@DM4PR12MB6109.namprd12.prod.outlook.com>
References: <20250730151207.4113708-1-manikanta.guntupalli@amd.com>
 <DM4PR12MB610977A84E60005E87C1B45D8C07A@DM4PR12MB6109.namprd12.prod.outlook.com>
In-Reply-To: <DM4PR12MB610977A84E60005E87C1B45D8C07A@DM4PR12MB6109.namprd12.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Enabled=True;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_SetDate=2025-09-01T07:42:56.0000000Z;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Name=Open
 Source;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_ContentBits=3;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Method=Privileged
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR12MB6109:EE_|SN7PR12MB7372:EE_
x-ms-office365-filtering-correlation-id: b7aa52a6-8adf-4735-4c92-08ddf1c93a58
x-ld-processed: 3dd8961f-e488-4e60-8e11-a82d994e183d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|376014|1800799024|38070700021|921020|7053199007;
x-microsoft-antispam-message-info: =?us-ascii?Q?WQGfeVdjwpGTpBs13TgJn5Hp/z5h1D/9isGWhrVVyKe5WUXV4DAoPzzyAeoB?=
 =?us-ascii?Q?ty/9M6GN2YDEV7970J3QleVMa91FhnfHkbHStRVhPAJNkwuucRr1ZL+/Iq+Y?=
 =?us-ascii?Q?Eyo4xVDbFnaGMJaKW162B/oiPeyB2zrRrJhW4fRRAyGwujQ2CG+SYkdMG7KE?=
 =?us-ascii?Q?NRhc+I49hp94f5k/QBNLr0nhzyg5ox8wgXiqfiGt1cDsmGH5aYg3CnDG574f?=
 =?us-ascii?Q?y7dXceneC/IWN55fHqxqS5fXsFXOcZJg+K9AehUHVEWG7C9FdYzq5cBC1yi/?=
 =?us-ascii?Q?wxyZbr41ivLx03PfUM60uTdMusDNBuAHQ1CbYbJ0yfHn82dpxVDiIhrFSuWb?=
 =?us-ascii?Q?TRk3KNJR04+P4FRQHwzodLVZCR6oYW31IHhii1by2WywuAWpdScqGfJLSkMx?=
 =?us-ascii?Q?8aC9Mp+heD2NiGoLyUepgd+WUhYqTln8HSkCEVp6vIdom3tPTQhh+dWj30le?=
 =?us-ascii?Q?p2JWK1nXviZIG2pyO9R8Hu7fu+TEkXPz1/6MwaiotkS0ZvAHpfvr9oZ2g25C?=
 =?us-ascii?Q?Ma9ZZn1I3YkxT//bERo5hsHtPl6p1vDvGu48Lg90yVeRJxv242Ny1lJr5zdU?=
 =?us-ascii?Q?39CNDcv19b2MWpDBTfwfZeLZwfygR+doMjb3seT4OkkbOBhNVEvzvWkDqWRe?=
 =?us-ascii?Q?ObUFb4IGln0s1AJGGWcd0UfRVSIa8l7Hio9r1uBrLLpictbCvlIoaOWGaMZ+?=
 =?us-ascii?Q?bN/ZyjYUd4ryOg8VaZ3s1ti/h8NKgd6opmj58LXQGEI7j+x0RYEJzH3euHBM?=
 =?us-ascii?Q?/aLI479CZzmtS2/868M5RH5N89OhlxDNmRS/zjS2Rw74LYNX73YtoC0XpaZ4?=
 =?us-ascii?Q?fSeoVIRkUYjw1m5VnHob9yHnoQ1vGrTdkNFhCHAnQgMZhoFnT60tDocK9nkm?=
 =?us-ascii?Q?nqockLcrRBMUbRRFZK3ih8YYWKbEywB4QGJxXKn/DntglEDYDwUocf8Y9U0A?=
 =?us-ascii?Q?y58cPV5lwDz3cpW/w045wnK+7XfqHDVE3bk1Solw7ez+ysRJoK5cbYeIq5xH?=
 =?us-ascii?Q?QVvsQiXGwgYe0e85UHA/xZQ3Sd+rIVfErmLv3z9ZSKsklEX4Qr9FVzOABXFB?=
 =?us-ascii?Q?+qiiy+jTltttl/X1ywV9B9tgRmuSvUyQEK89uX56Bkko75+a0GXgEg+muO/0?=
 =?us-ascii?Q?CE1IGzJ/wuLHJVyt4VxQSI4Yr65kJ0ynFqH1eCkO9b9ITyZ5lvzwZ1px3Jvl?=
 =?us-ascii?Q?EcTjYlIFr8rWcwA4uM8+6k2WNpQeSjljqqyFI+OAW1UXajeLi3C8AUzAx3Bk?=
 =?us-ascii?Q?fA/x+Ac7n6dMzKvJojHwT/W2wrZ58JXQuBPQaZ2UJX0aQ+9dc8jRi56T+FR6?=
 =?us-ascii?Q?Zfn93E1rcgsuo+2ZiI/MNWDTF08RxplqCgrdCRR6W0b5cP+g0Ed8+0Pj/ERf?=
 =?us-ascii?Q?cXQenr+L3WPJEaey//tJZ6Q9DGli0zDLcJZvNkyltJTF8Tja+DRA7HKJLnk/?=
 =?us-ascii?Q?wpHDtPOJRiXq6GC4H2mPKZVRxkDloGZrLsn5ibXqT51nSKqSwSh92PuNbo/K?=
 =?us-ascii?Q?hTxww2NLEnQ7uFbD3/gCgQXpMXp/ezRYRvHr?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB6109.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700021)(921020)(7053199007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?6yv4vs5skElyh4bgklWVODsxm9SyT5HukBLWdmiGn4AYZfCMoVUL3qG+s3ql?=
 =?us-ascii?Q?GJ92lJJE60k044igsFbOorGLnkC9IQ0pCMsLAsCXfjrrkJ44V/NZOkjWButn?=
 =?us-ascii?Q?V67wCl7ekPe7Axpv7tIlsI4EmBqoVIXoqaLpV6InhENfd738DQUVhjTSO7XW?=
 =?us-ascii?Q?GoZP1zjXwtRskzzp+AySGe8FDQr1EKK0O5chaFc9thP3YBWjGQisSwnzrWV8?=
 =?us-ascii?Q?ccvEPlCxCxq0wRpGqzZg3dw3TOMZcgyK4sN9DqXpFad6ymHcgiYz3xJdo5QI?=
 =?us-ascii?Q?+TN46KIRvqgri8VsrkuL3JyMMn+HMjRzyHl45fWrPF8u2pjrm/zMaa1lS9dL?=
 =?us-ascii?Q?FoIXWpvfu9imqhZ01m4lUQ7mMGSJpev/d2ImMa2c0Ev1mVr+yRIXlIi0/bx0?=
 =?us-ascii?Q?lu0SvNjl8PgvAWqEjzZjjHHxvSFjHm1Zy34DcatRpL+pXu1yeCXZrW8lJDbr?=
 =?us-ascii?Q?TyTcbn2+pPHQnnAQitxhofoB7MTOW3cApNm7MRgVlJLAwTSObVk9gANw6F9p?=
 =?us-ascii?Q?L9gbGLN0XYBiMBkIUSYumOhUkLtiZWPuoSTY5yiSihVL/JRRlpjMR1TcRpqN?=
 =?us-ascii?Q?1OZF7/tYgCs6Vs4K0pZPBqKvYmbxtuVyB1nR2GNj+6QFNB0l07MhG9fu26iE?=
 =?us-ascii?Q?S9AYzH8eXfWSXOkQ4Fik0cJNvzD1P4RpvyRGnHbmAJ/cbHm4zR7ktNSmpgva?=
 =?us-ascii?Q?fVXb9z0+MRFkBJFMcWemEOov8U6jctN5C65iQxUpJ62vnsfX3N09j2HVEMvZ?=
 =?us-ascii?Q?wSw5nPSsh2CmIDJyLM+RWd7ZYCFD5fEdMrDhVlGmT0JoTXU+EMwynVEwJNkM?=
 =?us-ascii?Q?8E3R2fJTm5rWV9ZO6WUDUAmn4coaHdhArEQ9LyIC+sb4E7Mc6OLmaPYKbowZ?=
 =?us-ascii?Q?uspCiT7rYqh9SZzivVqef/wk+0Yk4nncJbY3xFEWF+9oHgWDJdol3SZ2W6Gg?=
 =?us-ascii?Q?1xy2g9tMXGUSJg37oDI9PjC46j8mL0FfrZYTOFjLEzN4/bePAmUKs9V+kX/A?=
 =?us-ascii?Q?+QnrER80QACfuTRNC2oq9d4ZfFMAp2+RGLxSl2axeuywPMQMnG2TzZ4nNCas?=
 =?us-ascii?Q?f1gY5floWNpVviSbeBc3TXKDxDWAr50GjCwskXhj5h2v6Z3l9qv5oRsKNwH8?=
 =?us-ascii?Q?8YUoYpSQ9uLZc83LMBQb+acZ3oG5OnMSYwcO+bxSCIfJNO6cR56I3KARE7J/?=
 =?us-ascii?Q?DTBkaBuUUX6qgrk5OCHolLoJoe2VT1TsTYytQLYaaFyOERBah7WBmPiDXGc5?=
 =?us-ascii?Q?XhRPoYQBaCltN92nbzuau9mOqUX4cCmQdNj+sj6xq7RqNgHbgFBh58Wesyty?=
 =?us-ascii?Q?ra7iHFXHHOi/DlIfSTrUydv/w8WtMsWb4MVUHZcKZDUabRb6c06UzzDJCuWE?=
 =?us-ascii?Q?8gsdIkPkz4VvnFKraa6eKrUtJAvCvzSQnb3Yg+CyTCklOA9qdn2FWBxxH7YQ?=
 =?us-ascii?Q?e6JFzoGbLOd30+yiDYc8i+ka2wFcDA6C7qmBTLAdoWodSNhyS4a8SxDZNjZE?=
 =?us-ascii?Q?FgXlE1QRpCmjdwrMoafuix45CY5PxDTxjNSRFWP/RzCyhJ/qR/6hHCDTy7Vb?=
 =?us-ascii?Q?YzWd5yBoTVxjchlCAjM=3D?=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB6109.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b7aa52a6-8adf-4735-4c92-08ddf1c93a58
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Sep 2025 06:54:32.5989
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: +ig171NY0wuKTuFSOvAmx0ikYE/+FeY5r6VctxoXz7zmm48yFOq/SMKT1KHcTMnxp6386nKNerQvWJcgYtXCJw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7372
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250911_235441_631039_0B1C4373 
X-CRM114-Status: GOOD (  23.94  )
X-Mailman-Approved-At: Sun, 14 Sep 2025 13:33:23 -0700
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

Ping!

> -----Original Message-----
> From: Guntupalli, Manikanta
> Sent: Monday, September 1, 2025 1:18 PM
> To: Manikanta Guntupalli <manikanta.guntupalli@amd.com>; git (AMD-Xilinx)
> <git@amd.com>; alexandre.belloni@bootlin.com; Frank.Li@nxp.com;
> wsa+renesas@sang-engineering.com; quic_msavaliy@quicinc.com; S-k, Shyam-
> sundar <Shyam-sundar.S-k@amd.com>; xiaopei01@kylinos.cn;
> billy_tsai@aspeedtech.com; linux-i3c@lists.infradead.org; linux-
> kernel@vger.kernel.org
> Cc: Simek, Michal <michal.simek@amd.com>; Pandey, Radhey Shyam
> <radhey.shyam.pandey@amd.com>; Goud, Srinivas <srinivas.goud@amd.com>;
> Datta, Shubhrajyoti <shubhrajyoti.datta@amd.com>; manion05gk@gmail.com
> Subject: RE: [PATCH V2] i3c: dw: Add shutdown support to dw_i3c_master driver
>
> Ping!
>
> > -----Original Message-----
> > From: Manikanta Guntupalli <manikanta.guntupalli@amd.com>
> > Sent: Wednesday, July 30, 2025 8:42 PM
> > To: git (AMD-Xilinx) <git@amd.com>; alexandre.belloni@bootlin.com;
> > Frank.Li@nxp.com; wsa+renesas@sang-engineering.com;
> > quic_msavaliy@quicinc.com; S-k, Shyam-sundar
> > <Shyam-sundar.S-k@amd.com>; xiaopei01@kylinos.cn;
> > billy_tsai@aspeedtech.com; linux-i3c@lists.infradead.org;
> > linux-kernel@vger.kernel.org
> > Cc: Simek, Michal <michal.simek@amd.com>; Pandey, Radhey Shyam
> > <radhey.shyam.pandey@amd.com>; Goud, Srinivas <srinivas.goud@amd.com>;
> > Datta, Shubhrajyoti <shubhrajyoti.datta@amd.com>;
> > manion05gk@gmail.com; Guntupalli, Manikanta
> > <manikanta.guntupalli@amd.com>
> > Subject: [PATCH V2] i3c: dw: Add shutdown support to dw_i3c_master
> > driver
> >
> > Add shutdown handler to the Synopsys DesignWare I3C master driver,
> > ensuring the device is gracefully disabled during system shutdown.
> >
> > The shutdown handler cancels any pending hot-join work and disables interrupts.
> >
> > Signed-off-by: Manikanta Guntupalli <manikanta.guntupalli@amd.com>
> > ---
> > Changes for V2:
> > Removed pm_runtime_mark_last_busy() call from the shutdown handler, as
> > it is being removed in the following commit.
> > https://lore.kernel.org/linux-pm/20250704075225.3212486-1-
> > sakari.ailus@linux.intel.com/
> > ---
> >  drivers/i3c/master/dw-i3c-master.c | 23 +++++++++++++++++++++++
> >  1 file changed, 23 insertions(+)
> >
> > diff --git a/drivers/i3c/master/dw-i3c-master.c
> > b/drivers/i3c/master/dw-i3c-master.c
> > index ae1992665673..2d16b7d74743 100644
> > --- a/drivers/i3c/master/dw-i3c-master.c
> > +++ b/drivers/i3c/master/dw-i3c-master.c
> > @@ -1762,6 +1762,28 @@ static const struct dev_pm_ops dw_i3c_pm_ops = {
> >     SET_RUNTIME_PM_OPS(dw_i3c_master_runtime_suspend,
> > dw_i3c_master_runtime_resume, NULL)  };
> >
> > +static void dw_i3c_shutdown(struct platform_device *pdev) {
> > +   struct dw_i3c_master *master = platform_get_drvdata(pdev);
> > +   int ret;
> > +
> > +   ret = pm_runtime_resume_and_get(master->dev);
> > +   if (ret < 0) {
> > +           dev_err(master->dev,
> > +                   "<%s> cannot resume i3c bus master, err: %d\n",
> > +                   __func__, ret);
> > +           return;
> > +   }
> > +
> > +   cancel_work_sync(&master->hj_work);
> > +
> > +   /* Disable interrupts */
> > +   writel((u32)~INTR_ALL, master->regs + INTR_STATUS_EN);
> > +   writel((u32)~INTR_ALL, master->regs + INTR_SIGNAL_EN);
> > +
> > +   pm_runtime_put_autosuspend(master->dev);
> > +}
> > +
> >  static const struct of_device_id dw_i3c_master_of_match[] = {
> >     { .compatible = "snps,dw-i3c-master-1.00a", },
> >     {},
> > @@ -1777,6 +1799,7 @@ MODULE_DEVICE_TABLE(acpi,
> amd_i3c_device_match);
> > static struct platform_driver dw_i3c_driver = {
> >     .probe = dw_i3c_probe,
> >     .remove = dw_i3c_remove,
> > +   .shutdown = dw_i3c_shutdown,
> >     .driver = {
> >             .name = "dw-i3c-master",
> >             .of_match_table = dw_i3c_master_of_match,
> > --
> > 2.34.1
>

Thanks,
Manikanta.

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
