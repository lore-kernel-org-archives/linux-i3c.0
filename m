Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4AB1F5A8D9
	for <linux-i3c@archiver.kernel.org>; Tue, 21 Apr 2026 02:49:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=h1hT+/Hq0ZT2zyHtc1TEerWAn+so9cHsZDr+nNo3HWQ=; b=s4oamzEeCNPhgT
	KVwu7f318rBZ4yM5Nd0WL/8biMOqmHcARMqKx6yTaOd6/TCN5EmCdMgSvIOIMvgnZl2eMcq4IC2Lm
	WfQ/OTxNliNlPEZTqB7gJZkaxi6nptpjEiB0S2zB1WIfJvW3xTCnqGkd6bUXw5BEP7h4IPGlKVmnc
	wmE/YqyNNYDv0Xcrh3Ma3RGUK0cY+kx6VLC/pLx+/mcF92DG1bZ2UzlDYIWmlF0JJlkERMi1si0uz
	Qk8s1b/A8oczCkavZDJYsP7Og5NjGUJgxA3NpBWloAPrQNrTa5LH/HDaK6nEGp9vynOTYppRReP/M
	9HohCEvaqnQQzF2tVIFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wF1Ad-00000007xbe-2drU;
	Tue, 21 Apr 2026 02:49:03 +0000
Received: from mail-northeuropeazlp170120005.outbound.protection.outlook.com ([2a01:111:f403:c200::5] helo=DUZPR83CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wF1Aa-00000007xbE-3dDx
	for linux-i3c@lists.infradead.org;
	Tue, 21 Apr 2026 02:49:02 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=frnEAn4FtxYzjU/fGYWLjSJj47Z6hIDxxWE3E0ce1mCy5QXCDvw7H9DNkNEz0tuu2HL0mySDUFbX246+6kEsN91ejA2J9zoJrc2t0kBfXZ59+SewhCQjHji84BOKQstu56W1RK9+hEYiN5XM1bK/AW800Xaj6rH4OYsnqqKmWESX8kkk7kwNKLf6k+XKkkMURdqyR5h3CRR15c5T+hvzq8HHGDsfid78tjjAfVtM2tw4B+bhoSusoECtTJCb2XUk/MDsRBp+OBC/sIQt4zhnE3dLwAQaX/YABS4weSqJqpoKyizVjRgsY0Xojutvf6k2EmLLZXM9h3Z/a3Lnoo4dOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FOwz2p2tuylQFKEMZEYJL2SwSI5G/ODjsExpKT8FfJg=;
 b=Fka/YgHhjBshh0p9wmLxp+f3r2Y+8YS7w+N9t/syipHym+rayYDe8eWvEPgQ661/3w9Dwj0SvOTlc1j0+X4HkyHcNsYXF9n75uNPvPrJncExBuFeQakstA0bmpgbQfgGzHeIwwgWn7Cb5NUIy4Vh6DFtab9qJ0tdyeC4QwTxxH8vXEVqcdOITerA71CZtkxQITwhs2NtT0jT7ifNA7uJbQXlQ0uaT3n/ooaghlAQIun/tZMr+M/Mds4kmP45l73wBfeeto7ocU4QTMgIbshOlWbaqPLuKNhEyc7/sO0FU4YA2qaGhQB7LI6H2Lyq8ber4SKjW1DzayJiH42FtaNg9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FOwz2p2tuylQFKEMZEYJL2SwSI5G/ODjsExpKT8FfJg=;
 b=DSbyufaXV5zt+mmtBnaXKxcjTclj2lwBXvpiKGFqBHSZj0AumYGIR0Z1lFK7lPTdSyut6Y+sBqETL5rANGzEabRvamuHYVnl2z7rmeAv4wAUcQiJMdTRwehn5WporgyATbiBNOEjIOP7qm1ro/7P2KWYb6PkDoA82OZifXqLJMo9KKYWrBYHip13/4L5P1JWaeieZe+QAQu3x5qW1vzidS5WQSoQ7VYMHFN+e2URRfE1HAJbqpcmiPWmZxnIzUsQkPXgfhxyoxLI0mGOE4uHKlNonkyqMYUq5Dxt4plmxxuZYeb7RwKpEmV8e+h32BRbssHx6K3uaJp/1V0xODkqOw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by GVXPR04MB10135.eurprd04.prod.outlook.com (2603:10a6:150:1c0::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.32; Tue, 21 Apr
 2026 02:48:55 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%6]) with mapi id 15.20.9846.016; Tue, 21 Apr 2026
 02:48:55 +0000
Date: Mon, 20 Apr 2026 22:48:48 -0400
From: Frank Li <Frank.li@nxp.com>
To: Maxwell Doose <m32285159@gmail.com>
Cc: alexandre.belloni@bootlin.com, linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] i3c: master: replace sprintf() with sysfs_emit() and
 sysfs_emit_at()
Message-ID: <aeblkBbdKYSuUysd@lizhi-Precision-Tower-5810>
References: <20260421011049.63899-1-m32285159@gmail.com>
Content-Disposition: inline
In-Reply-To: <20260421011049.63899-1-m32285159@gmail.com>
X-ClientProxiedBy: SA9P223CA0019.NAMP223.PROD.OUTLOOK.COM
 (2603:10b6:806:26::24) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|GVXPR04MB10135:EE_
X-MS-Office365-Filtering-Correlation-Id: 4b588e82-027e-40f7-35e4-08de9f50875e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|52116014|19092799006|366016|38350700014|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: exzPC5NrzT7TX6957aof4lJb0znhMv61e3GBlLEfy9p48bH5h6uEC0ht5OlwlF2yX+La8chnsESqodQPYrGdhkHJo9qmdd2vz1twlP+HysdNs7ylEc89QBCuv3amSa9KM00BHVeO1DxLtdmvNLMCpp+zHPEK7Q4qjLGgaEaEPjBWTcoQbhk7gveoeUiAn7Cmn3WS/1G1SkA+IJgw2G1Fu0S8igMs2gHpCgui1Mu2iYbFe1Z5zbuxieH0xDZHTiHNMryFcoQgEdaaqCFjHfys77AOl4jXN0pGT6UQT1kQA7dwBXzveMuc4YS3Mrisqdh1ziFsH8bQZ0um2R4UGNX3SkkVxm2KQPDopZgmsElc3zGzeEOy6LTCKNBNjBogWmMDBv6H3cAoP7H9KFoSObVmn1Qte8DyojAPKizq/ps8QfWxdtN6RRV8ZyfG/l8WIUSo0obhuCDjBVtkxuO/Saar5jrRmrQkiuwcRs1YtOwxfYY6UR6ItRE5GjnXpqtk/1Eu1cN0bHsnWyKM9jANyLu+9ztQiHivNtdt4JtN1SgQDbLa5t2+W3zg71BgaKrCga+tcEKSWAgsrz4fyEenadlPTtChIBHFNtmrCasoVDOjvegpSkxAyzYlDhDDjerTN+HofGGc/2IZCFDD3g9y/4FmSDu8dkWGGU88HG9nWGoDx0NOo9TZbf60FxNj3V55Hr26Zrnlh+oGQ5Mp8AeSVaPxmyahGXttx8FIgHEVFxNktAP6zaCcaZtXxyGkOF5tdpaKCyOOCxKA5yTSSqZd787praEy4SudX8mwcXUXOILdN2M=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(52116014)(19092799006)(366016)(38350700014)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ELOpnmFyqksHof0ok7hCMx4cI4KQosBqHaMiqI7IsofeupiF5YgGtTZNze01?=
 =?us-ascii?Q?uY/qVTYIKzNfgocIb78YdUswR8TLO7WACwUT3rPEoXrmwXhTcNMbEZamXbM2?=
 =?us-ascii?Q?KpB3Qr4YgS91BUtv0ZhieB35CQEpLFRqoLMVPOtFX5NPuYO6oaILr4iRMszl?=
 =?us-ascii?Q?UOn4rDaWUwG3CrfRmrUj1+6JGlHBqzDqDTz2ul1qLvsnm+Wa7szw6Mv+ny+T?=
 =?us-ascii?Q?vgdpoJiRheduC1yXNOTUWz8D9Xp8Bnhe9mvWt4dVy6pJjIo1yVLSUOtH7JQV?=
 =?us-ascii?Q?3vZqFCbilOqH4znhUeJMGQUQX6MLDBa5pboP4NEaew67gCIONenciJUb0Xim?=
 =?us-ascii?Q?OkW/EP8m8mV1zISRgAoj01yhi8OTksOfw5Ba1Xf+mShYco3jeNqzPiBw2rWZ?=
 =?us-ascii?Q?uV8h/li4DS8o6b1XVz4GYRKsCpYlXhWKukz8+7265Lrj1cFwPnvZRufDDRc9?=
 =?us-ascii?Q?j+rpFbBmzyH8rDro0+VK49gkBWnR7OYqm2MUgNq9b+frhhqG0dqZcSCE0ODW?=
 =?us-ascii?Q?47iDN/1Fr3oD2QlIIEQj0Oh9QlloRraNk7DHIC3DTK9jvQqn1FDrb2nEulbN?=
 =?us-ascii?Q?pwa/i9k0bMIMFjoDDTSVovnpBcXEBhf86MfvA2m++1SuS+UlfbVa1yuNLW5J?=
 =?us-ascii?Q?NNZnvtnDoFNHNvvooq5zR31nuAy6agOcAE9BHObL2nVz8nyR+EvmjUELgB+4?=
 =?us-ascii?Q?E4lU2UT7jLXIsbFnoHXauLXtB7hg9TgYUibiTMnWc0RKk5Zy4IjHf28Jnzjx?=
 =?us-ascii?Q?F/ozVRSkhEvulIGqv3DrQmcUsNbwTGXfzTQcHsS8BLrBKsCtTbVzcBorf/ws?=
 =?us-ascii?Q?ghhnVH+Ug5nrGEXm8LmlrRCIkrXXQINxoF0q8QpS8D2luzlwcza03rXZgtNA?=
 =?us-ascii?Q?p0qwiVG2Hky9b3U5gGp8J8XjsKo3BNdeKlV+6eOoaIfkZLiXSIA7MwUmpVSK?=
 =?us-ascii?Q?rB1l0l2WciNJp141X2GUFriwHdK43RA2Cw+2k4qdL7oDfHtU4gdr4vVOyW4s?=
 =?us-ascii?Q?acOZh8FR9grNOlCEemyPPs82yCx+/Uy9caQrDpDkH5qP+c8VO78n0Wu+uoiN?=
 =?us-ascii?Q?M6uN7en7MB+OHkuR+C1g+LJ5GV2oREm9HSV09I0NUjZKfstGB9xwBAXodJRZ?=
 =?us-ascii?Q?cMe7mbrexCvkD94Xwj6XlkON3qDgoxxnpd//3ZrG6sjPhuAfO8DZo9wCXxy6?=
 =?us-ascii?Q?4c5OG4JPPjgPJd79FMyzzlSUwJPlpb6ppjp5+AWTo+etk8ENSvqMEJW4P8D5?=
 =?us-ascii?Q?R4xXk3PC26UldzYvnDVabeol11vFjZlRcNORJwYJ/A8V2JoEZo6tjHoAlxbt?=
 =?us-ascii?Q?Kxno9u+nVyeYZNgveuyH53lOIGSzVZs58a0svPW9WIxy3EPTkKc6M4zN6Rjz?=
 =?us-ascii?Q?UBK5qSW89+Tlv5EcwJhF813NxrJ7wNfU9CDApvMlNFS8myUINhKBkW25l7Uo?=
 =?us-ascii?Q?24KGv3xTPgbXDvs8WdH23A60ejsM7N2Xa8RWnuC6whL/S3R7tpB5iClgfTex?=
 =?us-ascii?Q?kQVRjROFi37yW9Ylr3FwcWJ/7ZF+3IfICusn6o+QfDEwPCR4ZzSHAf49Vc0X?=
 =?us-ascii?Q?dpeVtVbZ98q9AJ2fAi1J80GcxIKfMZs8nOdmcxo8+x/saTTvbgIUuh6HsVTC?=
 =?us-ascii?Q?E91bimU6GY385CICTOqWJPnfDSQclATJxZ9zwN4DC7iyYpeh2hNZXpJllwjB?=
 =?us-ascii?Q?D93Tu3MhHOwRqyz/xFjF7xgRftBEWrNqyXPE1DR/OTs+dOJ4?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4b588e82-027e-40f7-35e4-08de9f50875e
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Apr 2026 02:48:55.1988
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PM/Tyd5VgFHOPHt7zJ/t/SLLon0uZEOTRLpwV2hXNZ3lTHx7F/8mSC4bp6wigK49/DpD0PGAMOmNNsqkeeGDvw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB10135
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260420_194900_909225_ABF7E5A4 
X-CRM114-Status: UNSURE (   7.06  )
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

On Mon, Apr 20, 2026 at 08:10:49PM -0500, Maxwell Doose wrote:
> This patch replaces sprintf() function calls with sysfs_emit() and

Documentation/process/submitting-patches.rst don't prefer use words "this
patch",  Use imperative mood

Replaces sprintf() with sysfs_emit[_at](). Add missing newlines at the end
of some sysfs_emit() (formerly sprintf()) calls.

Frank


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
