Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53952D111A8
	for <linux-i3c@archiver.kernel.org>; Mon,  1 Dec 2025 06:44:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8eG2kAB1g05PZOL1oRbG8U6jbgH8k5k42XY4k93Xa7s=; b=AQh87PFIKkPvbk
	nqqMB+W4iYPQoTs8Gr0spSYJeCi/IM2XIFiCeXG7OZdXu8SmmWbFtFmdKl/HCzM6hFod5RW8d/hvf
	SoIi07G3X4cpUbqAr/Kw7BJ4C9JMLOj58FLISmvg+BvtWiTVHcmtCZPUpUq0NkpIW2k2mY4/nxfFw
	ddqy91tYZDLwIoHR80KTclvBGZZxvyW1zUUtRfna/GE791EHwjyoX8J5GC87+Gk3JU+iJf8QCuZch
	OB1BJPZOPWCVJvxhaQ8H5pq++mm4MeaxisV2yRKYo3u0Ww41snRMWHQbSZZiWE9vMOA/T77VHCl/u
	sIQ/8NIM5TtJAYofJHMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vPxeK-000000030hn-0Mhp;
	Mon, 01 Dec 2025 06:44:40 +0000
Received: from mail-eastus2azon11010056.outbound.protection.outlook.com ([52.101.56.56] helo=BN1PR04CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vPxeH-000000030gH-1S5n
	for linux-i3c@lists.infradead.org;
	Mon, 01 Dec 2025 06:44:38 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=D4eDOGR8fUtgY6QP4LU2bTdF+OYMxm3kibkPU2SydQ6GPuBpDHa8j8+OLd2AEIOKCKfzDbcHFT1ALTEzhBYLPc3gkC6j8I5fCx30ovvmx3UOYbw3oUqMP3I9PBPVApLulD3aGDQHPrb/20az5Dd4LD/LzewOvJuQs5OCEBBkxnGTFYNjAyhWLHiGntNqKG/vrGmcUt+6pN6ZPYEDmza71IoDsr4RQiTHzRVfLJOut2n6xUJrzOKW4J//a8/vwh0R5tudgoIm1PJyM2v5Weul7+/SL6k468JPOBrVWjLoUdoNWSubLEtcJPhk9bOCaIoTAHj132UxUbccz4/rkkKo6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xaEm0zOzBn21jy0g8I48vBFSxKXMaKvwGSbcmsiaP+4=;
 b=C0Sv8m/YxrSgDDryTJXCIy8AU4dwrTMIznGAMTwFIu8ElEe5ILUl3WCSCiPZMUy5wDjjJ2sf0YIni3/mKlHTfFihyVPOq/7ckSSNIB+wH1v9kAdXVLJdkUgMNKzd5kgcyxclnNajkYYpnW8lClOg8pKV/cd31kDsnBGdygL+hXhPDu9N/IOwJXV9KwWTmqNABqDPBd+CJsBUxEI6u6vGtofD6hAAreFxTJYbc1NUYyzUU5m9xKJzjiGY7gxTCJTdIIYEuA5mQkSpVjyQHsnjOJz2KmcI3BOAXNcSFbUqXrYVp13bJd2W4N8kIDmC+LNl9UpRPuR9r8VsELxYypt8bw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=altera.com; dmarc=pass action=none header.from=altera.com;
 dkim=pass header.d=altera.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=altera.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xaEm0zOzBn21jy0g8I48vBFSxKXMaKvwGSbcmsiaP+4=;
 b=oS/ViGYOUyOdE9nTPwM4Q3G/i1MZzBRmrraIZfH1MAs+T7PO1t+SZI/vCdiX6QUJ5+kU7T7sIvuQldPJxroJpjOf+uiJsEHSujqkz1MoAjlDnUSxksdzqRdofDJYb8GUH9zEn4SE9+PpQ/kCSki/X7J1zvNHpnDXBN3ZLSV7+rey9pfkYTO+Wf3eSrksKpTMrHzLAlRI5AGjMDfbKk1t9QItjcfmTDubmndiS9okeYtgNMnqOteaxY16QiUXguJLZbAt0xPgeSfLkMHMqYwEk7sovSd8wdSLqHURiPZZ/ed2xpdOPS+bh/4UwskQNnc41qfAYl8rdIyLKAr/NiSDJw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=altera.com;
Received: from DM8PR03MB6230.namprd03.prod.outlook.com (2603:10b6:8:3c::13) by
 PH0PR03MB5847.namprd03.prod.outlook.com (2603:10b6:510:35::10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9366.17; Mon, 1 Dec 2025 06:44:32 +0000
Received: from DM8PR03MB6230.namprd03.prod.outlook.com
 ([fe80::abad:9d80:7a13:9542]) by DM8PR03MB6230.namprd03.prod.outlook.com
 ([fe80::abad:9d80:7a13:9542%3]) with mapi id 15.20.9366.012; Mon, 1 Dec 2025
 06:44:32 +0000
From: adrianhoyin.ng@altera.com
To: alexandre.belloni@bootlin.com,
	Frank.Li@nxp.com,
	linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: adrianhoyin.ng@altera.com
Subject: [PATCH v4 1/5] i3c: add sysfs entry for Device NACK Retry count
Date: Mon,  1 Dec 2025 14:41:54 +0800
Message-ID: <35bb0a3cae4664dc423ef57a1ef3ebcb378bce00.1764571045.git.adrianhoyin.ng@altera.com>
X-Mailer: git-send-email 2.49.GIT
In-Reply-To: <cover.1764571045.git.adrianhoyin.ng@altera.com>
References: <cover.1764571045.git.adrianhoyin.ng@altera.com>
X-ClientProxiedBy: SJ0PR13CA0035.namprd13.prod.outlook.com
 (2603:10b6:a03:2c2::10) To DM8PR03MB6230.namprd03.prod.outlook.com
 (2603:10b6:8:3c::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM8PR03MB6230:EE_|PH0PR03MB5847:EE_
X-MS-Office365-Filtering-Correlation-Id: d7b7abb7-0c8f-47a5-6a8b-08de30a51568
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?zEoh+1lHmWApJpVw9y3asQG+YgMQOpoDC7mqAX5iDSdBMDC7ayyXTkLzxta/?=
 =?us-ascii?Q?NZnJcBfzXhDgPZ5AUkwvjBfFhty7U1WcObS3/7qiSPaFe/vYztjs1R9d4tG4?=
 =?us-ascii?Q?4IIeb6Hv0ARUOz8QMsPvSEpWj5PCVWpmTqNC2oew4mDFH6JCHJ90DTZn/oOe?=
 =?us-ascii?Q?1ycydgRpfasQRTWe3Xk0J+Lmj/aVOUPLximCq0w7Vxlaiqf+8qYmMAcOMaBM?=
 =?us-ascii?Q?BlOiefDqYdVpyk1vaz/qE+o8XKkDD/Ibf6mXyqpbItqCCCEWChRw8DUChXyt?=
 =?us-ascii?Q?uBntr28O9kWdDpsw01lKcH6kq1dhqBhWOS5i86/wy2SVToXyF9sPfw0wO3Fh?=
 =?us-ascii?Q?NvYcmhXD0DvL6tdRbxY4HOl7fpamsyvkNFVDhTYdMmWuE24a6wJ2Oomen7cX?=
 =?us-ascii?Q?snw8qtSZeLzr0b0F8OuIK0QJxRh7GBoI2M9Vfvzz26y4MAh7sAoQ+TRRI26P?=
 =?us-ascii?Q?EaEe3cjhAx/EUdGj+b6pNVO26v9p/Hw8v+sZ7u38flHajEOhEZU9nVbLfuIo?=
 =?us-ascii?Q?4JbTWzQGwOZjcXfdWBLQZ1/ORxiGvQz6mr+3QzhoOOn9Z1lnd9tB1rnn8TyX?=
 =?us-ascii?Q?zdmVcqr3mJrScjGl9etuA09kg/SRZJpXG2T3xvTTwtKEb//GgLgxT6Es0DTy?=
 =?us-ascii?Q?cZIGzqFJlVEcj8m/t7t0Oh5pXYIRN71bEebj1mdDkKeh95PRCR1a35bzZgN1?=
 =?us-ascii?Q?ieOiww6FePc8rqnwXbZvQyL44SHr3+GPJDDDhMKVe4xBieR7L/SynHkPhd3g?=
 =?us-ascii?Q?6x51RclY1mwh9DrbG60mIUHhB3uluvYizLijgD0wQk3R3X/K+uJvVsLbKzVa?=
 =?us-ascii?Q?cx1GEbXU7kcnZ+QxDHrFgwot9gkEnT45kMrc4syXk+y+0xztneDBXu6OmUdJ?=
 =?us-ascii?Q?S1BAtJyLT2Zqaf+g9n/UMtPC+pbsGYd7CEr21h3y/uIVDoLiCn8LN6TQ+LVv?=
 =?us-ascii?Q?l4uSoc2Wy7ZmLeqXwhkmCOwg0TkCw/ZmWMwJEaua7OPoZxX2GT7e9V1duf3j?=
 =?us-ascii?Q?zFAFjVAxieRcSFldgo0ut+DGxgJ8ZskwJx670/cGZwIPW35BqPkhAHUH50zE?=
 =?us-ascii?Q?3oGfD5vpZlLIF638RilUAZnMzw1mJpIhphWujS0Pxv2eacVJ3BG62eRUCon3?=
 =?us-ascii?Q?Y7RJrqkJp8WaZEO07dvp8Jb6MZ6/k1AKxqH9HraerZSWix7THszxpNI8bZeB?=
 =?us-ascii?Q?9Gt6Ednt+k2OrSdxgDIKPpN3t41dP4LTDnHeTFgT30RYW/4ltLKL8qKQb0E2?=
 =?us-ascii?Q?Ec2IMuLjcN0WVzsh2rB01PLzaDJQJTb6dupXuTDnt5bIZZxfUYDcdeTadlyL?=
 =?us-ascii?Q?xD+cSUYO+VuFuyQ23x0ogXg/shYBb0ImzQ5nhfPut31w1Y1WYEX71k131ftf?=
 =?us-ascii?Q?7GkZMtrjsEhoV76kZjEh3ok5bCEnDQPFJzrUBCEA7dR/9BKwT7cHA6iXPLAr?=
 =?us-ascii?Q?eA/2fLLuCkZDSU/j4WkuzWO4xkCwk5hk?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM8PR03MB6230.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?+07mOx57zrUb0v4zRw+GVez4+44d02Qa8DJmzvyZZ3QfgdPUcY5VkIvNi7Ri?=
 =?us-ascii?Q?xzr/zeAL79tRArgUqYB6YPx01p2Af+IYLFdLkWXnJCUcHLX+w7hhcjaMvc9Y?=
 =?us-ascii?Q?Cfm8toRTX+QMdZp/D8JcBt+r/q6VbEhJfHgMhlr1F9o2QakLUUDXTyeDbYe+?=
 =?us-ascii?Q?mVnOnNPcDO2mT7MCbkD+uUH35oP9lTzX/56TWn1nPo/EYhGGHUHi92htrq4S?=
 =?us-ascii?Q?HIh3VHjrXQw9l0wCt/l7WII8gs/+AWelKR7Wj5ywamEZxmkYIdC+U+qSE4DA?=
 =?us-ascii?Q?mgbyaif6J4RyT3bVqeWvHEsGhh00XIClXS7CkbG3uOGiUUk795smi/2BGzJw?=
 =?us-ascii?Q?2kjLMMlp405+tpFReFCM0/i09ckcC9mgiF+4Oc9AUjzK9pEcKRB+gws19DN0?=
 =?us-ascii?Q?4wh+DC2EZ3ueN7Rj7GknpBbOUNhjOzAQSK/TrkCwUOktAAQ2DGG8oAnI0EJF?=
 =?us-ascii?Q?koj0wo92GlrFUAuSAwXz+gugJIejrZKSvgkx6kk+PNtB5OHMpf1DFnQ0iBFU?=
 =?us-ascii?Q?7fjDMKM9X7L2WhdWgljdfSx5kYJ0hXtau11aDyv6A4ifBJ4SI5SGeMe0ta02?=
 =?us-ascii?Q?JMuED80F0JCvR1ZaAQ22Xd+RY8ekW7CIpyH4x6rvB5mxpIYAuUprVeL4cM5/?=
 =?us-ascii?Q?lJUxkBpi5zTeINSpuoRfyPpVMuPl8cVdKXKPh3rnQ6BoCodUjN491HWtmul6?=
 =?us-ascii?Q?m+vyNsH8+1RWS2NzvIwQ2OratoFjOn0deXoKOne1gXvLUdv/XJPlsPRqoTAo?=
 =?us-ascii?Q?zVjSOgfWMY4OqYo71sj5zvDU7EWjDcrvgRHXQ/XuyF/gaBi7uTJJReABGhyz?=
 =?us-ascii?Q?4Wuy9tYh+GiEh9YIhC3R5JRDge8eelGDNgzTuBetRd8p2q9qGQZFZKnuTcD8?=
 =?us-ascii?Q?THsOMCVoUz0qCGUkV9hihq5ZmMABq6aBGS52R5MJm71danlgqZW+H/DFH31P?=
 =?us-ascii?Q?0XjUK+Xt6z7ZuvS0bf+Wf2qJnsskSa9l02b1bgXcVMO9lSJvlDEQhe8G6dkA?=
 =?us-ascii?Q?g2LzG7PNMXsMiTBGOzoLSlYupyp5EUAVb/+jRyNdWI1Y7YvYMKO6gAUQjtUO?=
 =?us-ascii?Q?ZlTgEZB6l2uEhAyBNJsmVCDkEtolADDZi0NbJac2D8I3EeFbMf0jpJ4qyo8r?=
 =?us-ascii?Q?Oe4r9OSvTh54CG2cTXDKHk1kj2B0D7QjSCzaHSSFoXwoK3iWAXqN504lG131?=
 =?us-ascii?Q?zpiLU3ccrzxKxpa9ZBBhYw0ppCkU/aHpLcjPYg8w3xBd4oFbQt/Jkq2dGTaq?=
 =?us-ascii?Q?50NHUIBGtYOwxdSS4VeGOw0NMsjO26t8PvVj3p82ZWHIQwlFKkpussoczjt5?=
 =?us-ascii?Q?biZG38XBzXxYWpejV4IkL1latD8vD6oKdfzG4jSw/vGdxQ/h1G0L9GBzWX1L?=
 =?us-ascii?Q?YWgbqgYedD2HSGLfM2eM/OVI/2OJNfGx3bwCxByc/BcPosY6r/32wwvgfrKn?=
 =?us-ascii?Q?6V388cq4x6c9LalVG+TtEkGEEOQlL0XDXuXrlDGlAB9OaXtAdnJTHwADllyg?=
 =?us-ascii?Q?QTQ8M8hn2Bgg2taF4BNIOXPkK8+Zvo0vvQ6k6+1Mk4IOnSk3/uGnmrUS848A?=
 =?us-ascii?Q?GwBss+RpDGgnkdSlvzzFaHUcMlzMVIDvtvBzrxzWonqYNFaRwGwp+w2o3XDO?=
 =?us-ascii?Q?vA=3D=3D?=
X-OriginatorOrg: altera.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d7b7abb7-0c8f-47a5-6a8b-08de30a51568
X-MS-Exchange-CrossTenant-AuthSource: DM8PR03MB6230.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Dec 2025 06:44:32.2974
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fbd72e03-d4a5-4110-adce-614d51f2077a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +WEFkig0cmhtt9VJkPkMrKAadwkOXGOjNYZKFvoH2x7q0e4P1zhEobN4liJTDC5Rsd0deNOSSSpmrs3lUuzrL46bxIV4T4BmD/OEXeWKucc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR03MB5847
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251130_224437_388334_5D305D3C 
X-CRM114-Status: UNSURE (   7.41  )
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

From: Adrian Ng Ho Yin <adrianhoyin.ng@altera.com>

Document sysfs attribute dev_nack_retry_cnt that controls the number of
automatic retries performed by the I3C controller when a target device
returns a NACK

Signed-off-by: Adrian Ng Ho Yin <adrianhoyin.ng@altera.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
---
 Documentation/ABI/testing/sysfs-bus-i3c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/Documentation/ABI/testing/sysfs-bus-i3c b/Documentation/ABI/testing/sysfs-bus-i3c
index c812ab180ff4..0b8a0c223f4a 100644
--- a/Documentation/ABI/testing/sysfs-bus-i3c
+++ b/Documentation/ABI/testing/sysfs-bus-i3c
@@ -161,3 +161,15 @@ Contact:	linux-i3c@vger.kernel.org
 Description:
 		These directories are just symbolic links to
 		/sys/bus/i3c/devices/i3c-<bus-id>/<bus-id>-<device-pid>.
+
+What:		/sys/bus/i3c/devices/i3c-<bus-id>/<bus-id>-<device-pid>/dev_nack_retry_count
+KernelVersion:  6.18
+Contact:	linux-i3c@vger.kernel.org
+Description:
+		Expose the dev_nak_retry_count which controls the number of
+		automatic retries that will be performed by the controller when
+		the target device returns a NACK response. A value of 0 disables
+		the automatic retries. A max value of 3 can be configured. Exist
+		only when I3C constroller supports this retry on nack feature.
+
+		Valid values: 0-3
-- 
2.49.GIT


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
