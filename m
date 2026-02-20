Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6AF75C5ACC1
	for <linux-i3c@archiver.kernel.org>; Fri, 20 Feb 2026 16:05:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ydd03PwUxw5jlDI6nkJeXP6yYf9e6mal8LXiCi94IDI=; b=1rDMBi3VL3NFKD
	03PmgDFycKpSRsObrunEC+Re/N6cZtd3PLrKlrDWoTGqDsAcmSBUkF4sxMB7lAnohqUP2m9Hkvicg
	+ibskUVFQTOdcgAWRyON5jvUflklXGvq26FtBKoasakRvjY7UN5CrqNMRs6IFGVHohaQ2u7UFJ4/6
	H26Hyw/S5KUkRtlVIbvSm91IJZmMHalvlrIhjngcMe7pY+50xjdGF9nunbbIqsDGMDuGc77UP7R2f
	wmvR63lVgYRNzb1C9fs1DGdj0PSCnBfPPMmGaX2gXUhtK5H2MWYWQYpUUugvD+lB5yCrRjUXl7Uo+
	BxdKJRBJ6YnwoZEGd2nQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vtT0d-0000000FADW-459a;
	Fri, 20 Feb 2026 16:05:39 +0000
Received: from mail-westeuropeazlp170110003.outbound.protection.outlook.com ([2a01:111:f403:c201::3] helo=AS8PR04CU009.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vtT0b-0000000FACQ-1R84
	for linux-i3c@lists.infradead.org;
	Fri, 20 Feb 2026 16:05:38 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=w/hU6YihxqSW9kO/u9R9z+HsrKR+yexNAn1lOlKWBzoxleffpIhnGJ8Ik+awYJb44S/lA4fSo9o6vn9LFeAQ48nJnWLQqg5Vga4q5EJVlftVgkYSN8slalUyx0qe5SagftnKrmayj+bd2pB2O0Q0Y5uU+Ecso+GUIJuM/pIoGcKofSrRHTKpQsqnu/zlr0mrPNqSw4Jo2jp6zH0K/NYM5aMrb1zUPo8wTmlX7+HgPHydJQqHHPEkYjs6ZrhqMdMcQ0qJvHbha8E7Ju/Jh+cy/qiOZp0sJiItVBiSGlmAWeT11ovEKhIoVgpD5YEefIKwagK6DkEQOpuVMoV4upJoUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eRk+vgkrEtF858GUYAYOrBi7QtglUk/altd3j7cpKU4=;
 b=ozPIpwRkaTuLtpXDQnf6BJ2WQT72ZX370xkulvsrTmw2gSTdn+ToelMj/g3e6KTnuv0RBnYpgtEw7l2JPTCn5RWnC1b73ivwwHaU8LiBlRlLAq8r0hiKy+iwpI2A4EejyXb6gEfeX/f8Fy+8OhiQg1lc633JmF77qbhV0WYD+NCUDGW++RwL7Ihgqf8W9iTSKzEgUKt4p5QxT/OlcrSs5z2hXIa7sfAYdir1oT4MI92IKYnaEFGJLE14RC3s2pk4BElVAg/YyWO2FvX74WiVB+XkUfSidlwJ2mypl4cZHNQxMQca8mFeH0vxqTjTIX0NXM5KUYDOOzGPBONex0t/mw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eRk+vgkrEtF858GUYAYOrBi7QtglUk/altd3j7cpKU4=;
 b=BSYLsxswsKiOYT9n4Dgy+t20Qd2NaxgthTR73QZUTQUra/MbkjE3A10DSwzJK4olX945pXjBp41T77Mqe2nlEnxIvruyXiSM+3LC67G/wMt1zJUpuQijMTv9rhfXpOWofgWlO7L1Rj7SrPA1mGKEwx7ul+ed8WZY0Oiv00eSmR3VqKAIYcxfOB8A7pP6EfiAeW2jOBgxDXpqb5p0qqzqtptSQKd0sPsSzrzENCAT4nr6JmGLi26jNhfpexw9NPcAdoobDav+NZ5qpMA0nVmcrlg3UqImN6wqF5t9oYdi1UYK6DigV5x+YZsoRuljcRdAgs/lSUFiF9saHz+GKk9jiA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by DU4PR04MB10497.eurprd04.prod.outlook.com (2603:10a6:10:56d::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.15; Fri, 20 Feb
 2026 16:05:33 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%6]) with mapi id 15.20.9632.010; Fri, 20 Feb 2026
 16:05:33 +0000
Date: Fri, 20 Feb 2026 11:05:26 -0500
From: Frank Li <Frank.li@nxp.com>
To: David =?iso-8859-1?Q?Nystr=F6m?= <david.nystrom@est.tech>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org,
	Joshua Yeong <joshua.yeong@starfivetech.com>,
	Meagan Lloyd <meaganlloyd@linux.microsoft.com>
Subject: Re: [PATCH v6] i3c: master: Add sysfs option to rescan bus via entdaa
Message-ID: <aZiGRrRIaqbMSaTI@lizhi-Precision-Tower-5810>
References: <20260219-i3c_rescan-v6-1-b81d6cc3cb30@est.tech>
Content-Disposition: inline
In-Reply-To: <20260219-i3c_rescan-v6-1-b81d6cc3cb30@est.tech>
X-ClientProxiedBy: PH8PR22CA0015.namprd22.prod.outlook.com
 (2603:10b6:510:2d1::23) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|DU4PR04MB10497:EE_
X-MS-Office365-Filtering-Correlation-Id: 87767eda-d81d-4c67-375d-08de7099e053
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|52116014|376014|19092799006|1800799024|366016|38350700014|7053199007;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?yt56a/5b0RUFw/FKz6p93TFd8FPwkA2/psDmGUR8Et+S7PclXwi7PQmezj?=
 =?iso-8859-1?Q?ocs95QW+qLd0pkqkzPngQIZTl7Tp5y8AmouHEwhbTSoWhm4gJ0R3osmeDc?=
 =?iso-8859-1?Q?fLdDTF2v6Zp157cybRl48QvlwRL4nFUyQsdqR+Ez42rQ3E+pJXvDiXXlTl?=
 =?iso-8859-1?Q?TUWs5KpQ+jH3oH9Rt+VOlFgGi4KwiMuYNsaeAZfjXkE8HBoigwvc6AV7Na?=
 =?iso-8859-1?Q?WFqkoSP1gnZAc1eZmYAtNsGGA/Z5ww+A8D/Ju9hW1aEU8oxkkUkiozi/Kw?=
 =?iso-8859-1?Q?qKcAHTx7a+AglNMYFMwuur94ib4qqHGPkdvZkvy+78av0G0oFiiVAwSFQy?=
 =?iso-8859-1?Q?kwt8AYlbNWb5kC7iuLPW47epxb2VcAw36FUDtvgcrsilhm7LVS+pypUcaE?=
 =?iso-8859-1?Q?3tCQrG7I35QqwGO/4VK2Ps1jQofuBxkP21WEv1urz0KMp11Txccwj6Sk1N?=
 =?iso-8859-1?Q?blWdw/xJgEDJLhRC60awa0VjTv/h2gAVuQZJqPPj5KEsAHcx9ktqOw5C6H?=
 =?iso-8859-1?Q?2TY1S314ZOOgCDdY3AbPt0T9zZnb9r3YNLr+bM7EFiSXJsxXOY+HocVn6u?=
 =?iso-8859-1?Q?PM7oNOnPm1v//B2ZgiggHEL+kxJ8Bfh/7JHDlEWBITcu8QdKe4HUh01fMi?=
 =?iso-8859-1?Q?OEhKufh/8/ceILHjy0ye0+NkuuuaWgv+oS4PLH1R9n5CfJ1eoxN/dlsqb0?=
 =?iso-8859-1?Q?0E57pBCKT3d04jfbfitC8wMBmBpPqohqEiP5Mm/ukn68fMIK2ZBOeqmH6E?=
 =?iso-8859-1?Q?GbUPhoz7KyYeS1XU+ndanL6LE0R4lnB6TCqv4YTa8mmhfAKESkRGTnHqyi?=
 =?iso-8859-1?Q?zd12RD9h05ewaRxbdSUf9qzXc4GzujCt2r708yNLms4hv+Ir8D7/ybFYzW?=
 =?iso-8859-1?Q?pKLlZneCFHPF7ExGlBgs08GW44aGOH7FW9pDTCvuueFos2Hmyl+RE2JgcP?=
 =?iso-8859-1?Q?lwPTFuH5QSBHWR1N9/JrSeLrluX4Mu4PPFMcMlzWN+eAcqQR8DpRbev5yb?=
 =?iso-8859-1?Q?NKfLLS0HlKG07ScpQ1I6xalbxVUYSC1AZDwEmpT0+cv7N6kCFtlR7VzrUW?=
 =?iso-8859-1?Q?WsNTAiiXQFXXnpfy7UYSFhSvx9QGmdtfNxcH4n5JpJr+lKuPrWvCLU/Dmr?=
 =?iso-8859-1?Q?fOlyQVq+QyIyK9uuIkktdPbZsOdm0TLR/DfvmCpIh2wkzWpXTgFoWzpjO+?=
 =?iso-8859-1?Q?oAo7DPVSux9Gq0qMCgTxKZNNjNW8/vqIt1g36Gu3o2k8ze5LI8tMNyMEiI?=
 =?iso-8859-1?Q?dt5Yj/kYmtUCHJNPLyrQD0ww9du6twnRBZfGGzlDcTmC0iK7GVnFO/dCsj?=
 =?iso-8859-1?Q?f7dSDOe0myzwAotPnoTgJ2qoyNdx4ieEuC2amxx5IMiVPL4tRlh3OFTu+F?=
 =?iso-8859-1?Q?4R2VJ4OwFA7H4LVxj56tuyNhtUUIoAZfLpzMeoH0tmiIGjW283tGEtw2mi?=
 =?iso-8859-1?Q?wCP5mcXRS0J7B/53LdE3X88RBsC1CQ2DOMBnMnYi4oaFz7QJ6YNEBXUbdI?=
 =?iso-8859-1?Q?JA5kqkgGmG+suhoqKLZuMWxs8hnP0PtuM7N2DQ9S2/CAw4Fh0ELPmirYW7?=
 =?iso-8859-1?Q?r4akTdM4eSQVzon0K8MwD1KzaiRhbeQ1VZFcZd9GiDvUwlizOwVWV5QbaK?=
 =?iso-8859-1?Q?0/3qcefBfojXnuM/o1gWKnaHU0hPcNIOZN?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(19092799006)(1800799024)(366016)(38350700014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?A0Tf1c2J1z91j95AJ2c8oA6eAiQSys/MAY0OLNzeSggp6HdTRZogZLQIjt?=
 =?iso-8859-1?Q?UWjw+SWWwspz5VO2dcip5YSicdkdmj3szGXk04E1ZBy0TqOgOdp7Q/bL9b?=
 =?iso-8859-1?Q?ZXO5U6WViuwk2SBHOPFe7G2+7EPv2GxmvyK5aHb/OzoIl0q5+AR9sBYWdK?=
 =?iso-8859-1?Q?gLPIY/bWukAtxDsYd1lgHrxB6itxo6/wqKIag7IS+hsq13Oty02CmxqhjL?=
 =?iso-8859-1?Q?KxaFy6a/k8k6IBDv0q3rfBP7Pm/9dvYZKBHiWY68VJ2lqcDsw4LZc1vruK?=
 =?iso-8859-1?Q?PowxIcDoj7KU8/4tidWItm1lIzj1E5Gop8GgdlNCvQdc6mvqO1KoYYJLL4?=
 =?iso-8859-1?Q?7xzX+4k7ssxW5YhqjJDt2MiavXNNAeioDV8JkJx7fbqa37vWi6xYaZSLpa?=
 =?iso-8859-1?Q?RrpWfsNTR8xOcjtsn8odG8Ng0wBuLnJ/qEUGq8a+ZbwVzQlDySsV09Ib+E?=
 =?iso-8859-1?Q?cHL7PRTioVF3Nddyv6dK6nI+raJw9YMcV9r6w0vR+x0XkdnJ8g1Bw5Lthz?=
 =?iso-8859-1?Q?2KlOY45B6QB4usk5ErdidnJKnU3HMwKUtM6Am3NRZLfOZdNvLSqR31PIZ6?=
 =?iso-8859-1?Q?GXVdBKFpFR+EmrgGhnGdF60vaGYljPM1Cpo5Tmw7FWgf5D+WIUd35ULRrW?=
 =?iso-8859-1?Q?a4HnUn3QD3hLbpsPTgGtxDEaq4OsztHgnRVcLtWWChXOQPA15D1kIlg7um?=
 =?iso-8859-1?Q?jhBg8N3dCS0j0zpaHdiN88mKY8AyRDqDgCA4YV48CaveCfeWpj4z3KXLdk?=
 =?iso-8859-1?Q?EoREPmtC0tvJ19/wj0K6oMyS/JOHPJ0tHN+AxFYff3w3FyOeTozlpL5ak8?=
 =?iso-8859-1?Q?i4U0c0XGJtMeosOLMKAgbqArxD82oOekFA7/UYlk8OXciuicqdAGgG+7vw?=
 =?iso-8859-1?Q?Lu4yZJftTPEp4EiQj6NQFimy5sBeAtpJqnU7iPd0Bl4BSe0DKSgsUmUOyH?=
 =?iso-8859-1?Q?ylJBS2PPzibySSbWZBWND1c9/NcJy3fvPnw3UCV7aGxwx3Vhw5SEoI6UlM?=
 =?iso-8859-1?Q?9n1O5mT0xZ9dwuNVeZPriir6OyKiLPhKxBkaOd9hV9BNjJZSvIEyXZynzp?=
 =?iso-8859-1?Q?Z4AkdtTirlQqjDTItL7xyB2l6PnTCGwPsLzDr/oH9ztofzk9JmbI5vhaaA?=
 =?iso-8859-1?Q?+qCyxS7ihNEd5YabLj3NqJ04IrmyXo82rxrZucYtGq13ZQRfr36agFAzpS?=
 =?iso-8859-1?Q?s2UUwm2A78i1gVSAAlLQULSFLbRT8mQ+t2qRai9sNYJlTvRCBplKJTRrQR?=
 =?iso-8859-1?Q?x3tE+3aitf1hLh88UnJ3RibpU3sBMRXNXYUTZ7xUsWOFUlVhsJKiWgqixZ?=
 =?iso-8859-1?Q?lYcBGToBuVs0TkawtQG85jxtdi+IqQQ40SdIYIC8Ol+oakFEQy2ErWYtzU?=
 =?iso-8859-1?Q?4uGsAkCoPHUcedSZzDpqkNDCqH2jaguf9PQCaL+leXeDbTEdMacS2unGho?=
 =?iso-8859-1?Q?xwqogNqc7RLhUgq8mpRtf06PwGKVv0e0ax2C8pVgRPdnePxUrS00bt+nQN?=
 =?iso-8859-1?Q?MiVGY5H8TjH9JcBOyRZB9kwBUfjO+6PyxFThyOVfsY4O+4EZWUSyXMa2Ni?=
 =?iso-8859-1?Q?smGzrjJxDgwNAK5NCJkhqJWzvyXHaqZIgRzWb8OZZKbKSjvT7z9x14g4cM?=
 =?iso-8859-1?Q?vpSi0+1qc8rKUEEyAzuyYF+31UgIVpIbXvSb2cXPJgKgKLF0bM+DSXzTkm?=
 =?iso-8859-1?Q?9T5PaMj0ar2f3e8C1HhvsD1FJYGqICkwxWF7zo1dZ1Ow3FTHIhYjW9zq51?=
 =?iso-8859-1?Q?lORTXIh+EwmGMn82v6opLc9d6330dY4mqDKCHpjZFt8mnS?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 87767eda-d81d-4c67-375d-08de7099e053
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Feb 2026 16:05:33.0679
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JvjKRMS3+B3ssdcQ9GUuebMljLADyEjcGjLzzUbviAg7Vw3XlRbKRJE9uEXf/xgAVqH1m8rdtAZvBLoktplZIw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR04MB10497
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260220_080537_408407_3C871C4A 
X-CRM114-Status: GOOD (  26.78  )
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org

On Thu, Feb 19, 2026 at 09:58:03PM +0100, David Nystr=F6m wrote:
> Allow userspace to request dynamic address assignment, which is
> useful for i3cdev devices with broken hot-join support.
> This will assign dynamic addresses to all devices on the I3C bus
> which are currently unassigned.
>
> Signed-off-by: David Nystr=F6m <david.nystrom@est.tech>
> ---
Reviewed-by: Frank Li <Frank.Li@nxp.com>
> Changes in v6:
> - Add check for init_done to close race with init.
> - Link to v5: https://patch.msgid.link/20260219-i3c_rescan-v5-1-42404db20=
d18@est.tech
>
> Changes in v5:
> - Change sysfs interface to boolean. Comment: Meagan Lloyd
> - Change sysfs entry name to do_daa: Comment Megan Lloyd, Frank Li
> - Link to v4: https://patch.msgid.link/20260126-i3c_rescan-v4-1-6b3559d82=
abc@est.tech
>
> Changes in v4:
> - Improved commit message, once more. Comment: Frank Li
> - Added required documentation for sysfs addition. Comment: Frank Li
> - Link to v3: https://patch.msgid.link/20260123-i3c_rescan-v3-1-026429fa0=
c65@est.tech
>
> Changes in v3:
> - Rename sysfs entry from rescan to entdda, Comment: Joshua Yeong
> - Link to v2: https://patch.msgid.link/20260122-i3c_rescan-v2-1-84c74a483=
f03@est.tech
>
> Changes in v2:
> - Improved the commit message with why.
> - Link to v1: https://patch.msgid.link/20260122-i3c_rescan-v1-1-0c17071e2=
32b@est.tech
> ---
>  Documentation/ABI/testing/sysfs-bus-i3c | 20 ++++++++++++++++++++
>  drivers/i3c/master.c                    | 27 +++++++++++++++++++++++++++
>  2 files changed, 47 insertions(+)
>
> diff --git a/Documentation/ABI/testing/sysfs-bus-i3c b/Documentation/ABI/=
testing/sysfs-bus-i3c
> index c1e048957a01..19f5cf8b1b11 100644
> --- a/Documentation/ABI/testing/sysfs-bus-i3c
> +++ b/Documentation/ABI/testing/sysfs-bus-i3c
> @@ -172,3 +172,23 @@ Description:
>  		the automatic retries. Exist only when I3C constroller supports
>  		this retry on nack feature.
>
> +What:		/sys/bus/i3c/devices/i3c-<bus-id>/do_daa
> +KernelVersion:  7.0
> +Contact:	linux-i3c@vger.kernel.org
> +Description:
> +		Write-only attribute that triggers a Dynamic Address Assignment
> +		(DAA) procedure which discovers new I3C devices on the bus.
> +		Writing a boolean true value (1, y, yes, true, on) to this
> +		attribute causes the master controller to perform DAA, which
> +		includes broadcasting an ENTDAA (Enter Dynamic Address Assignment)
> +		Common Command Code (CCC) on the bus. Writing a false value
> +		returns -EINVAL.
> +
> +		This is useful for discovering I3C devices that were not present
> +		during initial bus initialization and are unable to issue
> +		Hot-Join. Only devices without a currently assigned dynamic address
> +		will respond to the ENTDAA broadcast and be assigned addresses.
> +
> +		Note that this mechanism is distinct from Hot-Join, since this is
> +		controller-initiated discovery, while Hot-Join is device-initiated
> +		method to provoke controller discovery procedure.
> diff --git a/drivers/i3c/master.c b/drivers/i3c/master.c
> index 0eae19b3823d..8f49d4ad473d 100644
> --- a/drivers/i3c/master.c
> +++ b/drivers/i3c/master.c
> @@ -758,6 +758,32 @@ static ssize_t dev_nack_retry_count_store(struct dev=
ice *dev,
>
>  static DEVICE_ATTR_RW(dev_nack_retry_count);
>
> +static ssize_t do_daa_store(struct device *dev,
> +			    struct device_attribute *attr,
> +			    const char *buf, size_t count)
> +{
> +	struct i3c_master_controller *master =3D dev_to_i3cmaster(dev);
> +	bool val;
> +	int ret;
> +
> +	if (kstrtobool(buf, &val))
> +		return -EINVAL;
> +
> +	if (!val)
> +		return -EINVAL;
> +
> +	if (!master->init_done)
> +		return -EAGAIN;
> +
> +	ret =3D i3c_master_do_daa(master);
> +	if (ret)
> +		return ret;
> +
> +	return count;
> +}
> +
> +static DEVICE_ATTR_WO(do_daa);
> +
>  static struct attribute *i3c_masterdev_attrs[] =3D {
>  	&dev_attr_mode.attr,
>  	&dev_attr_current_master.attr,
> @@ -769,6 +795,7 @@ static struct attribute *i3c_masterdev_attrs[] =3D {
>  	&dev_attr_dynamic_address.attr,
>  	&dev_attr_hdrcap.attr,
>  	&dev_attr_hotjoin.attr,
> +	&dev_attr_do_daa.attr,
>  	NULL,
>  };
>  ATTRIBUTE_GROUPS(i3c_masterdev);
>
> ---
> base-commit: 44982d352c33767cd8d19f8044e7e1161a587ff7
> change-id: 20260116-i3c_rescan-4921d0b41a00
>
> Best regards,
> --
> David Nystr=F6m <david.nystrom@est.tech>
>

-- =

linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
