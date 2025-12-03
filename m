Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93B91D1266D
	for <linux-i3c@archiver.kernel.org>; Wed,  3 Dec 2025 07:23:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AP+ouuFCv0CxLsyRgtUsCKWAVYhBFI8iqKLreXv1J4E=; b=XlfY5woLcGfbzY
	/asfAbMcCJSP0kooiA/aHiLfabKk1j3O4Wy1ShOQII+TUkZuz45UVjSI3H8uc+YFn99ym0yQei7iS
	vDhu7hGxOZHyrXi+4gpOliSZNGq6h9EZaul4R69e01qO9K2f9GBqaV/P+hZrYeEniOmZKhkOnhkdT
	akFzqNepkU+uOOXcg/68Fsheinm61rsIPsQwPIxcSvQEUZajY7o3sWI03UUP2+lYmQH7xr8X04tUB
	EhLRfSNv4XoTXkTe8wNNaHDD9lZOMqwm70rWfQVFfL0RrHyPw0ToqmwtYsWXKEH8DxZlmnfqSb1f9
	R7vINQuIxdbmoJXg0rhw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQhDM-00000006Fpp-1Rrc;
	Wed, 03 Dec 2025 07:23:52 +0000
Received: from mail-westus2azlp170100005.outbound.protection.outlook.com ([2a01:111:f403:c005::5] helo=CO1PR03CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQhDJ-00000006Fkm-2Bbt
	for linux-i3c@lists.infradead.org;
	Wed, 03 Dec 2025 07:23:50 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vaDkK1sV0/4xShcjNP17uCt7ESAp8TqAg92/otKENI/rn6G6ZAT8Yd2lOBLqCYX6jtvKoT4Hs4Ry+2cHkxfbQjQv6CpxTtd15bSen7jEtuk0XnyegpW+R1XyKXMS4/POlHN59EN++5flOE4kqhiMmOg8ydJYNWgovDGO2NqQd2+0vXipMbkCUYJn3SmnZNQOZjkswShZn+GC3ZDqQSdXIKPH+NkfZZhLXD3cApo2IlRiwLUzB28LbGxKnJnOfGHzONEKf1GkuXBM7VqMvZY1J/amNFLybx4wnTCTFbfLOIcI9fO9uLZf0TJJHGFLxinnIkT0sSUml0+KDwQ10OyoUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kbXzNm7qp0d/jodPmOkahTbs9+W1gsJLSTqu/jMCggU=;
 b=IFu/PI4dRzUAF9y0ftAT7ZFKUyDxQAycjMUNcbKGgJCZINFku2JqFrB7KpMviPhqyCVJ8nXduslbDWP1r9o51JJz6xp95zZ9YZYpJ2CTVdsV3SMLjLGQs7D8JfjzUyOc6qEQ1+RWGtYGkH0d/EO1NEtsu4AocWnNd+T6CLJ/XhYrbr2y7OvyRTDk/HNWOVeerVe3/CN2S/0pvcFD8Cpm1FmBbv0PhHqXlX4kgw5b8o25m0IE9sGEOBZ0+hgeI9FFc54ZLPC7XqfP8HRzpHtpLKUsJCPVsf+x4xRxG3Ma6htRXbT1LQ55Cx/iZ+KSHZ6tTd28PRHJ/ApgfISgR67gBw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=altera.com; dmarc=pass action=none header.from=altera.com;
 dkim=pass header.d=altera.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=altera.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kbXzNm7qp0d/jodPmOkahTbs9+W1gsJLSTqu/jMCggU=;
 b=KLceST3PIsZAZvyntHWYF6QxBZF6oXNDxoRWATBlJfaylwUfKmNpKG2e0kTXnoPZZTPq8YPb+nTCvVnzysLjxtc0R+eSJqX7GlbrBEvgIxy4sK1+PgzQkrhNRGEhYuDJOMaAe9rNOy/yBy23us8GTj8D2R5UjOFqEYUS18mCOjIXGaxgZCzR2iTFK7JQhcqjaythapS2IWtr4mu95HOEnu+xQIWz7GOzi7RFdi3BI0Q/HqWfYeAsEvyfSAOrTLUr0aUBB6uZwcXywy0XbnMowmoL3KOnaC1c6sFJ40mbmIhm+y7u+hwFmkkcSX9uSnv2KDWRHWjvRt4DRJ19ZdZu1w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=altera.com;
Received: from DM8PR03MB6230.namprd03.prod.outlook.com (2603:10b6:8:3c::13) by
 LV8PR03MB8140.namprd03.prod.outlook.com (2603:10b6:408:297::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.17; Wed, 3 Dec
 2025 07:23:45 +0000
Received: from DM8PR03MB6230.namprd03.prod.outlook.com
 ([fe80::abad:9d80:7a13:9542]) by DM8PR03MB6230.namprd03.prod.outlook.com
 ([fe80::abad:9d80:7a13:9542%3]) with mapi id 15.20.9366.012; Wed, 3 Dec 2025
 07:23:45 +0000
From: adrianhoyin.ng@altera.com
To: alexandre.belloni@bootlin.com,
	Frank.Li@nxp.com,
	linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: adrianhoyin.ng@altera.com
Subject: [PATCH v6 5/5] i3c: dw: Preserve DAT entry bits when restoring addresses
Date: Wed,  3 Dec 2025 15:21:06 +0800
Message-ID: <5b647e37d8f70dd35b4d2cf4b9df8a7a114811cd.1764746266.git.adrianhoyin.ng@altera.com>
X-Mailer: git-send-email 2.49.GIT
In-Reply-To: <cover.1764746266.git.adrianhoyin.ng@altera.com>
References: <cover.1764746266.git.adrianhoyin.ng@altera.com>
X-ClientProxiedBy: KU2P306CA0025.MYSP306.PROD.OUTLOOK.COM
 (2603:1096:d10:3b::16) To DM8PR03MB6230.namprd03.prod.outlook.com
 (2603:10b6:8:3c::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM8PR03MB6230:EE_|LV8PR03MB8140:EE_
X-MS-Office365-Filtering-Correlation-Id: 3c102fb0-0ded-4665-a77f-08de323ce526
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?2vPZJsjiYWKW6TNCGNIcAhSiTa4kXxarDH9sLrWJ8mdKQUlamKFk0zku2Fpz?=
 =?us-ascii?Q?vw46bDRs0wqP3S8j+vmaHR3pbKiUqaq0v/wacrC6935BGNC8QxQ+VfmBc8E1?=
 =?us-ascii?Q?e7wnmYtX1+HTrEnuLgsbgLa6eLhGqYmPPhzosqp6rvXlTIJ3FMRpScFpE15a?=
 =?us-ascii?Q?3xZSuMD2SRNpqjdHzm2L9GoIaYWqi+4PjB9xCUi02pvfiVTkvg8b2dYleMAm?=
 =?us-ascii?Q?JxiiyDFB6GEkysiDLk36TdgndprGCVb1Zlre2JuxFf5xMLfik6gO3msqbX+w?=
 =?us-ascii?Q?NlOfMjjL8esT+fTOpRLNgFVESsORXMd5VU+Z3UV/wBr98Heyida34y6Mv1y+?=
 =?us-ascii?Q?k0ZRVJ8m+jxXu7AkAojbWAbbuZMEUuUka5/I1nGyquUmovqE/60r4qQCGXOY?=
 =?us-ascii?Q?4NaQQERMDKovx3cg1xc1s+1CzYWMwJVJwsufi1z6bIuDv1ZDaX1UbVs+HR2G?=
 =?us-ascii?Q?j9ENY1NKBCwRiJq8U8im6G+Ax3xMqv792pdHj9PkrbQhukSyKWODCld+qSKd?=
 =?us-ascii?Q?JGf53FctwEboDkF0Ws2tTj72V84EAyRLmZPQDGbtEZHLgubZB+9PiIeOVB4l?=
 =?us-ascii?Q?YSgkWQdI2rLK2JC9clyetkGZ0r/RRtzuN3441YVyB7VwHdYlCHVikSzMwM2y?=
 =?us-ascii?Q?pMLfnQK8uGvo03r2669aus7HbOIPMyZ0esezDhPSEPjUACS+peyTmYcqg1lK?=
 =?us-ascii?Q?QyBYSvlL0KZboHAZoaDYm4anr8iiSi4dgbi7XsncfxvpkOSMBzwvToHsKtE7?=
 =?us-ascii?Q?TxXlVnttDmokA35jBlsz4VVt4g6/8jUCT4zqGM2SJmG3rCvO6LxIWYoCA4ot?=
 =?us-ascii?Q?RVfNwggcSse5HdPxB0hs8JK96aCFtG6HaVTVf7bRHkpwEncUzNxcbRPrbRuY?=
 =?us-ascii?Q?i7DzMxqTwx4dvi/VPWw8hHA3DrMmOnPl7iB1/hTm5bMm3xUTnnsSjU3Pylyd?=
 =?us-ascii?Q?mqLdpnnAdK24hvT+tLdUFdvwNw3GYZE6zhIJzm6jJocXSZiYZ615H+tVsmNg?=
 =?us-ascii?Q?4hW3mvVSkub/sAEGqYB5NeIwMgKWpTWYT/i1ZgMlysoaBXMtzAxe1wOmP34s?=
 =?us-ascii?Q?mj7mQ+8lsgg0S0T9iiNB5/VHfk/hrUvmQ9uR5k+B+xIOQjMypUCFciR8+eN5?=
 =?us-ascii?Q?rWI2JkolLLwSjaZ8p78RnyTkh3/APzVBi9AAATyQJi8hX1A7WuJLR7PMIDB+?=
 =?us-ascii?Q?45+An7m8JOT7suS4yZWnfplgeTlGLmkjtxbmPU803F6tHE3UkV0F6fXIFnWm?=
 =?us-ascii?Q?SjuN0ht1Ta32JaeDmh+iU1ukvML/XalbxcB+W+LfJ201ipYgbRNRSPKbgadO?=
 =?us-ascii?Q?EzvfnsvH7E67xVynfVP5/A0gshETOWShjj1R7THVrAYUswOrLGt5xxNzO3ij?=
 =?us-ascii?Q?LlfgUd4hi7hwMA2qQJ7KfVxUoApeYsLurlY63DMUwMl7jOB0nA6ke4B4SLuk?=
 =?us-ascii?Q?KyoVZCAOq933BvVhlsVhZardPf9CuGLf?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM8PR03MB6230.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?JsRmvAoBxUg+s6i5okpT2rbCR52uRmTPUQ8vQvv4/iw2OmS5llxZvDOjb0qm?=
 =?us-ascii?Q?NskE8qp2VtfvI5iTR1dbRSxMny2lrqnszNxdKy570XoLnOqyUPmLlnAjVPb+?=
 =?us-ascii?Q?/qxir5p9iqkTjsLSR4E2Av3T82GjPHIb/+Zn6N8Hz7IgZ7PdEJ2Ug1U14s+S?=
 =?us-ascii?Q?/ngMjmRpdCTCIYHhZeX+Q6sC/2eHlX9dpls/d8AZvNu4uM5lNvhwmsKSUSNx?=
 =?us-ascii?Q?B4ijlFkH9c2tNkZt0LBe6XGFC4wvBkze9P0dEXJsQBpyAkKujz8Mpg8+DAQz?=
 =?us-ascii?Q?Vduba389V1BMCttHx+3LnieO+vWjS7Houj7yP5rB5qagAAOcwJR2izph58th?=
 =?us-ascii?Q?EYHvssbsVzdm59wfXR3on7D5w/8ZDK8x08ZYVhNncEKhjWq4txsIUj257Pna?=
 =?us-ascii?Q?6HbF5jo9rsI9OkWkpc3P4C9xNMes94wQMAMH2l5AEmVeZAsBbPI2hW8bLigz?=
 =?us-ascii?Q?jEiYoJ8LYqMsM2tnvkTJER8yqH4NZ8YC2Uc4BL+ed3jaGx0GoHv6lz1dEiJ+?=
 =?us-ascii?Q?P/uDnxUL+cp5lq7L1Yv7pUwFXQ+o8+ijT2jiNrBeMC1kSdzz8YimfTBUe/KO?=
 =?us-ascii?Q?2GmOYRv6IZdI8rp6V/xSG374DaDr9pFcA9rCDuQX7HV1qhQcG6k4t6lQdBH3?=
 =?us-ascii?Q?EoU5sp6fJ0CY5KT6nhywLrAtti9s/uscqYapu2kpXRuljkdfdzqqvsWv0KSp?=
 =?us-ascii?Q?bsX6ptdqovp0o45tkRuk3KDbwZJyJQnWrLG4y1Y+gxsy4KL83tTsaDcyU+6n?=
 =?us-ascii?Q?Rf7dDobTTmOhCCu0eCd7Qiw1DRSPs0j+TQXqROAq18vZjyWcaAqx3uDL3D2A?=
 =?us-ascii?Q?IHORVJKgyYe8V9JWv5+AxikBL4e97EKxk57f8CPT2Ony4QMhQmSMoHS+f9h5?=
 =?us-ascii?Q?pCiNFGFvVmfnncUpIOzBQyhhLSP68uQFAyHWCztco0wpMVEUbXnC2OQboWoo?=
 =?us-ascii?Q?kKOABpp+JLgF/PCr3EVj4NI17hab3mjZczqyi3GyJ2uhTFqz2apee90OY6ho?=
 =?us-ascii?Q?2fCWTiG8JNBCnxugtllcADPPBxewgpKk3EERoVedmyAvNawpEMzvViTRSXDJ?=
 =?us-ascii?Q?9RSPAekbmz6wNs9dan8C2wKGKVAyheQvJKuxfVEkNcGEu6JJdF57HlKyboSH?=
 =?us-ascii?Q?xiNqqNrOfhWWhFe5XjqUAFhLrpdIoxXsit85Ga1g9prsNKM4+Vhcw73uwznK?=
 =?us-ascii?Q?IyBTuPIV/zL1PpgyNe1tyZ9j8Zxbtn8sB4xCUKgIyXiN0OHqsbQARDvjghBl?=
 =?us-ascii?Q?4TF1WQOEyBd6fDndYKq4c4s3km3Bgk8LvV4OLWISjhcn0JKlssyTAfFPYciv?=
 =?us-ascii?Q?j8YGnr7HRYaPRo9nZzC8DvGrHA8Nz+XyFtKxpUBF1OWPrPzypTgP3yeUAubj?=
 =?us-ascii?Q?pDpOPzh2zYO2B/gvgnytIl4t+6+qrLxAfd1UxUJQ+g1xwtBXTKmEuJngnLTp?=
 =?us-ascii?Q?d/++5nWlY7M7lVAf21h4XqajPpBmtYdKwOcXhuaM6p4zo5t92vazbNNPslED?=
 =?us-ascii?Q?Tp7G36c5EiFQVB0zeQdLz9OgpWuJa28tKXgPPsIxv+dxUwBb07XkFz9XbU2f?=
 =?us-ascii?Q?iPWJ5CJjxFVSp+VhdKpUA0T690QElS9hHu7gYfdCKZkdOqghKEweHDDqijm8?=
 =?us-ascii?Q?gw=3D=3D?=
X-OriginatorOrg: altera.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3c102fb0-0ded-4665-a77f-08de323ce526
X-MS-Exchange-CrossTenant-AuthSource: DM8PR03MB6230.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Dec 2025 07:23:45.7867
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fbd72e03-d4a5-4110-adce-614d51f2077a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QkOb1h1LjnWU6CBXA/9OyGO+u8PUvVK6akqUY6P72CqEDi210StXM78YQ5Irtut7bnCbTB81RSx7j2k882TV0TCbkUmJOlUo0BKXD1KEzC4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR03MB8140
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251202_232349_566425_BF2F4CF4 
X-CRM114-Status: UNSURE (   8.31  )
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

Update dw_i3c_master_restore_addrs() to preserve existing bits in each
Device Address Table (DAT) entry when restoring addresses. This prevents
overwriting configuration bits during PM runtime resumes.

Signed-off-by: Adrian Ng Ho Yin <adrianhoyin.ng@altera.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
---
 drivers/i3c/master/dw-i3c-master.c | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/drivers/i3c/master/dw-i3c-master.c b/drivers/i3c/master/dw-i3c-master.c
index be36b3d7b64b..cdb6daceddd3 100644
--- a/drivers/i3c/master/dw-i3c-master.c
+++ b/drivers/i3c/master/dw-i3c-master.c
@@ -1695,11 +1695,16 @@ static void dw_i3c_master_restore_addrs(struct dw_i3c_master *master)
 		if (master->free_pos & BIT(pos))
 			continue;
 
-		if (master->devs[pos].is_i2c_addr)
-			reg_val = DEV_ADDR_TABLE_LEGACY_I2C_DEV |
+		reg_val = readl(master->regs + DEV_ADDR_TABLE_LOC(master->datstartaddr, pos));
+
+		if (master->devs[pos].is_i2c_addr) {
+			reg_val &= ~DEV_ADDR_TABLE_STATIC_MASK;
+			reg_val |= DEV_ADDR_TABLE_LEGACY_I2C_DEV |
 			       DEV_ADDR_TABLE_STATIC_ADDR(master->devs[pos].addr);
-		else
-			reg_val = DEV_ADDR_TABLE_DYNAMIC_ADDR(master->devs[pos].addr);
+		} else {
+			reg_val &= ~DEV_ADDR_TABLE_DYNAMIC_MASK;
+			reg_val |= DEV_ADDR_TABLE_DYNAMIC_ADDR(master->devs[pos].addr);
+		}
 
 		writel(reg_val, master->regs + DEV_ADDR_TABLE_LOC(master->datstartaddr, pos));
 	}
-- 
2.49.GIT


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
