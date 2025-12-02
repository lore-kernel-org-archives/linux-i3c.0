Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0EDCED116F6
	for <linux-i3c@archiver.kernel.org>; Tue,  2 Dec 2025 08:29:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UvkMAKX88CSBW6IgQttQRPXuZjHGAwaqrc33dwJgXtE=; b=Y917Esxe2dYBFV
	bnYocgaVRXzEgllIe++rdfUYD8rp8fsQli4ls9wrq67ewxGCl66CXtepJfkB4AeNzdDZDNhb+RS6L
	l3Qbe59nBI6300LCtFBPwwQcjjfEeANpmQrqP/Ki7AaTZZIjcqRfBqN/TfmAbQePUK5W9bGr1lrrw
	1GV48679QK/2lu6VZqvGJI0CfjOCLfIqRv3Ez2su8cs3xrsbchHOKCHiEBQaXze52J8OzFYPm6mSO
	G4Ny4DZLWYMSHU5Gscgx+TVSQFGVEKLa5FBiT1937O64uXmOizJxdfvV8ayQL75nvBUI432rqenJB
	Ff5DFi7XuDLzv9ReEAmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQLkv-0000000538d-3HDs;
	Tue, 02 Dec 2025 08:29:05 +0000
Received: from mail-centralusazlp170110009.outbound.protection.outlook.com ([2a01:111:f403:c111::9] helo=DM5PR21CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQLkq-0000000533v-1Bmy
	for linux-i3c@lists.infradead.org;
	Tue, 02 Dec 2025 08:29:01 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uzY4ADzezvVQGnWszJUip+BU5yVcwnjqsXvWPVKSbKwbl+hJTQsNCCae3KV9fyiTwNnYgNSei9vbplKRmD3Mb+gRjLJ9aUzv0awynVyQ48l6ILjdBOnNTjXihW5AEZLWgwgytccF1UQg/74BJxmVWFCzj6r0mIycpIvFC3iR2r5hZkeWZCW8OdA+R+gcoKoEm/Ks8buGHk3h1oUApPq4ugYgFYi+aOEPuxUUzQSzklIfGtNvNZRFA3ZawGVoJzDST1xcQgZrd8gx1u89dzMCPnN69RCmnRlxUGk+d2d3/JXbLy3GiTBz0EH6m6v1qvY5jch9yD8SF7znDxsfQqToAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=O0zwBhFgyn55JUdfLUqamnuC3J3lPByDgsN3pIg5uHc=;
 b=iqDzk1NrpYJL6oJe+I3XFkGkJzrfR3nmbiOIESPQHon9JxAyoGtG9pZsg/3NFK9z2zpBHZj6v0uCA5Yv2k1LCpeq6ak7h4hKqYkRX5S7ngZHbSdP5VIQEkxEBlFxoQ4qUOHypyk3dCPenqHe/N5Lhdo9RXnD/vJGRb4ptHnb2hGpHoXMJjDoZWZVFnP3zGCKw9tmKMYIHermSTf4S1Yhrq92xzvi5DIiLmppQdnpsduAnze2l0Tk/1/fs/vZniQvxVQpNjQwwfq6Zt1QJucwerztnL+2G3X7cLf1bZ+WjrD4CWGYBAzq3j/m0iItXggevXLjVBq2MRYw4lc++g9Dvw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=altera.com; dmarc=pass action=none header.from=altera.com;
 dkim=pass header.d=altera.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=altera.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=O0zwBhFgyn55JUdfLUqamnuC3J3lPByDgsN3pIg5uHc=;
 b=AXbmuDSxueu/aocLuOBUVGAQixT3bvRSLL+mC/1hTt2aUpqrJJ/vKFUanZDsSaIzb8VNOhp4XyEpA49fAIYEA9v8YxBk6qrI/NHC2KEmoh0HfMJS4PkR4ktLiAKDFehQuWKF8ovKKfz5EK/2Gb+90H0fRpu4mq79tpgPPwDa0TeWmdfvVJZF/N5YWxkIGIetV9qseFGdXetItFkqvoqqYDUm7IwGE13LhKCI488A9OVQxd5ms//+UxUnCcHS5y5mP0WFS0oVxIp5DQuwtDDzvjrzrQIc2uwV7aIWKtEyQE0MGbJJXuOiXZP98UYRw7MmBoA40dk+nCqDrib623tt8w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=altera.com;
Received: from DM8PR03MB6230.namprd03.prod.outlook.com (2603:10b6:8:3c::13) by
 MW4PR03MB6459.namprd03.prod.outlook.com (2603:10b6:303:122::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.17; Tue, 2 Dec
 2025 08:28:51 +0000
Received: from DM8PR03MB6230.namprd03.prod.outlook.com
 ([fe80::abad:9d80:7a13:9542]) by DM8PR03MB6230.namprd03.prod.outlook.com
 ([fe80::abad:9d80:7a13:9542%3]) with mapi id 15.20.9366.012; Tue, 2 Dec 2025
 08:28:51 +0000
From: adrianhoyin.ng@altera.com
To: alexandre.belloni@bootlin.com,
	Frank.Li@nxp.com,
	linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: adrianhoyin.ng@altera.com
Subject: [PATCH v5 5/5] i3c: dw: Preserve DAT entry bits when restoring addresses
Date: Tue,  2 Dec 2025 16:26:13 +0800
Message-ID: <117625a9a02b2452dc33df87348ca36f59ead80d.1764663888.git.adrianhoyin.ng@altera.com>
X-Mailer: git-send-email 2.49.GIT
In-Reply-To: <cover.1764663888.git.adrianhoyin.ng@altera.com>
References: <cover.1764663888.git.adrianhoyin.ng@altera.com>
X-ClientProxiedBy: KL1PR0401CA0012.apcprd04.prod.outlook.com
 (2603:1096:820:f::17) To DM8PR03MB6230.namprd03.prod.outlook.com
 (2603:10b6:8:3c::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM8PR03MB6230:EE_|MW4PR03MB6459:EE_
X-MS-Office365-Filtering-Correlation-Id: 5daa7c30-bc83-4938-e391-08de317cd2b4
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?OdjIYez/jDEMNu7rDqLMD+ZzWMVYx4W05/lLg6bVS74RFJVSII0MjJKacgvA?=
 =?us-ascii?Q?jl2bQuiBH5d75vVy1u/wAGUPGCgjH7wdmIcPeqXrhYPyBdC0VqoD9oFeVH1O?=
 =?us-ascii?Q?C+qw42aD8I/2hvth8vq/wDadBKj/lWZWEIBT+U6TDfxdR/GdGSZHZM5T2NIR?=
 =?us-ascii?Q?E8HVFHXv/RUnSr3um/qo0cBuWf7YmzXAUbh4C9Mtgm0HvT2mer74rD65nga4?=
 =?us-ascii?Q?3vriYUmUIxSYaZVExBbZ7on07EO0jOevoaoGT8zh9mvo4paA2pC5NPTyKbvd?=
 =?us-ascii?Q?M0wwha8gX9tmbBTdKZOLFLHFjOLwS1LniXxLCwrU1e6O373+1hOwWBrxP+uX?=
 =?us-ascii?Q?axFH3kIzijDMFZ1yeFP6chei3XtbQhpV9gd64SQdS5VpbdHcxMtFc4f/l6ms?=
 =?us-ascii?Q?QihTCNXFbAr1Tzm4WW1Q26lvJZtOnf4BFv5Xcfe8LEBB5VsXTNyZP+NiTWpQ?=
 =?us-ascii?Q?z7PRiArJr0HwOm6xtBiBwbkn706qjaqf08Rkh1VFhUPoUpSTZHXtYoG/XSf+?=
 =?us-ascii?Q?L3gfH+vUIYdiypFQB2OQAQJ8iboFjXetJFnu/jf4Rax6lCpa25JIv9OsdFi4?=
 =?us-ascii?Q?KoFb2/BnDxz//47AeVfb7UBq1dQjJ1V4xzPshauqAGRUFm4XM8m9zhTcna13?=
 =?us-ascii?Q?QXDP9lw2xEbtVtXFa7zmjdl1g1y34pPK9BlkxF03RjYuAVboiIKxPtPbJiQ9?=
 =?us-ascii?Q?DB7Spm8IbFAinP0leP8V+hRy1galVKCoPHeLf30m9F1ywDadMj/gezVbEQtx?=
 =?us-ascii?Q?8uHyQMd4S3hQyFsABv3LmNvdzZ74Sejucz1PNbwD07sMUbCCUnnT5FDKWgzN?=
 =?us-ascii?Q?+gYTL52A3phZU+VbiZjsUgEcljSeve8osXxXnaREcmAteTkn8eytO9p9sIj/?=
 =?us-ascii?Q?k2M7rEj6yjvlbXfULssPXPorKTgjY0QEPWDgYesS4la/GxiO+89qWbyeLoHf?=
 =?us-ascii?Q?9geewSZs1eAKvDdJk7yoZJahV9SQxMHFl+I5+h8f/0/OXeRXdfFzDn5LjpJi?=
 =?us-ascii?Q?APvY20wL4bcS/H81BR0Di5HnpIBwEePAREJK4w7m/yYydsdTcQ98d9phu7/Y?=
 =?us-ascii?Q?UvrN/0mSnRsbXP8iRhAET2fHVGcua/tIUegoT3MK/nmd7zXpK/FkNSK2Xfxe?=
 =?us-ascii?Q?D/r09pu9dd7HFY3vduFWtnGjdfgUl/Hh9zyAQHg8J6dqiLuDlFiyWbznPr0X?=
 =?us-ascii?Q?2mT8gQ4fH+6Onx3SHE/sElYlw7cgkxDKlrIhv4LnPPHdCe3mYDs2t3/IglkV?=
 =?us-ascii?Q?y408BNsseynyg0ICQ1FDG9nspnXxqPyl7nskPnUfrsYZos+13SheM9UvnXrv?=
 =?us-ascii?Q?etKYD9+sDQ1zsmBIlQD8GBMLChwAnm3RuCIz573zU1s48HQv02zrBjQ8xbEx?=
 =?us-ascii?Q?ECcUwbvLa0tCYCFKkVeRjyq1O7t+lAb4sTm1VGb/qO3mXaUTk3MwNIKYVy76?=
 =?us-ascii?Q?HAE3zFnpesjb5xc9xt14G+h9v3LvOhY+?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM8PR03MB6230.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?jn6YlQ0dLjYAia045DrjtvqgZccHQJegIT2Iiv24JTRwRX/gh9wee5KwrTaF?=
 =?us-ascii?Q?fJ50kP+u3XeBpPlmfg53/vpxYSJ9yl9Xc0M/qGX8GvHUWHaio9E5ULGum+2R?=
 =?us-ascii?Q?YwWhL5NPkq5HX/Uleg8982m0cCvqB4mb2vvUPGGKmoeBgMBGryj4LX+PbNZO?=
 =?us-ascii?Q?a3mvAEnu1Ir+jhE2mSaV23PidEU6OivncV7DAhiSwTDWZyhPVOzHgwrCep5Y?=
 =?us-ascii?Q?dteWx8A3zquMy/mDZy7UvnUG/oFtX8Bftf+1mkWtjEzOT4uv7atB6c+F06gW?=
 =?us-ascii?Q?dCvqERlH1/gDcrLgQxpGMY/95ARYWs3WiO78x+9ObNFsSNjU7Xz53j13RCp7?=
 =?us-ascii?Q?H4wFZSKwEhL/QY0VwGSeaRUr80yq3XmTj9NVOBz+/ptVPGNip0Mg98jn4mL1?=
 =?us-ascii?Q?/pdXiOnYO/rQ/8hDMiURRx+v7NXRBy2FKf1Q44RwC2CYfAWI58ZS7iVV3aGP?=
 =?us-ascii?Q?0I1KZp4VADH84Q4i7CDEmjEadX30Risr7OBwATm9RNHz8IDJOloKhPudHizK?=
 =?us-ascii?Q?e73uZajFPbxNpIuRCxdYh/dpuViZI/6XCLdDf7JWtd2jQTyFfXcg0dkSFNWu?=
 =?us-ascii?Q?hCf4eUmac3LfojasiiSAWLN2WRz2K2In+T3D6igCr0s9DdFLUaWUGQFvuQ0G?=
 =?us-ascii?Q?R6rwhbOsgg8LJ++Nb4LSiB4N3WhRRNyOW/6x2HdDcQt/Vvm26ldpcsa81WzU?=
 =?us-ascii?Q?uqEIi62sdpA57P4kIUwHxnBRjraaoEfnx4PmcqkwtTIA0LsH65K0ByeZLYs7?=
 =?us-ascii?Q?qgdW6Xj3O9a834MHXKmX/TYlmAgK6/NdHhPz0FhKgOPclCJn+KlXUnFyYQK1?=
 =?us-ascii?Q?J6q1xYiaAg7541qdzeMLsU2+mKpoxR2ZgDGD1qlHpFFIfEjDDwyHdM2OEBW3?=
 =?us-ascii?Q?BIua8bKosI0Yyar7VDtwjMpN+ueTTqo2XycqhGj/UijQz7bRfQS7GOQhIW+E?=
 =?us-ascii?Q?f005tQmD3tOCtQUKLW3lENysBA7OWxOtyc6WqJrYlDXg/4OU1+OFJMZiWnT0?=
 =?us-ascii?Q?s1GPFzPw0F+IIWt86bbGayxUoZJaMeXpxD2C/eas8fEYVd708oWR1mu6h3j9?=
 =?us-ascii?Q?QtalK+XGTOhzMfBtNIOmlxpwP2348wj7osFOuTSzK7i+FNBlAf66LJ7wsHDB?=
 =?us-ascii?Q?+eO/0b98A9GZ5VdiZNAn+l/vHL7pf07LuGPLnNld9WKDs8foelkO+7jnrUpb?=
 =?us-ascii?Q?7sb5UzBptI5rt/rC0VHCGJhY1usZT9/4mcOnGKIBQouaGqJ6Ts27z7zrnHxv?=
 =?us-ascii?Q?hUyp7V4nf+zdzuwHcvKHHl5YcArqZKUYhg1pmQMU6cH7P2HLCrlH0kRjgkBJ?=
 =?us-ascii?Q?mxzxvKtQYeCRyDZoG6slDCZVP1j//P2A++x05N62gGgXDbKW3HrCNmR3igkh?=
 =?us-ascii?Q?E7T7MRqZ9F+2ASUoSHWbBY4031N+IMXafpVGhbScPkjVlm63bNnByy3JZm96?=
 =?us-ascii?Q?sXO5qgEJZwA1DhZGC78D3ZFXa4TQfTFc4iN5ikFLCc9ybDarbUcE3DoB3txm?=
 =?us-ascii?Q?8F6tQcCYHo/bs/weL6DN7w0VrU/UnY7rtOsWW5wGHrMU7FfNCbFRGJqdL1L/?=
 =?us-ascii?Q?RPgHIyfrMwpkOQJWrV9b/cP2iWNXdrHirwu3LqrhiGgefTrYiUANMQKVk7t9?=
 =?us-ascii?Q?9g=3D=3D?=
X-OriginatorOrg: altera.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5daa7c30-bc83-4938-e391-08de317cd2b4
X-MS-Exchange-CrossTenant-AuthSource: DM8PR03MB6230.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Dec 2025 08:28:51.4754
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fbd72e03-d4a5-4110-adce-614d51f2077a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /7TyFpTt2LGpVoX1DG8jk2uW42uaTB+1ejpNUbwIeVxafjKS74mH8y1tVIGHzeR9QmibvTuTfpCWUIBGPfL7hbhiOQ2DcYUtoX5md8Ui3O4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR03MB6459
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251202_002900_339147_2C4FDC45 
X-CRM114-Status: UNSURE (   7.96  )
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
---
 drivers/i3c/master/dw-i3c-master.c | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/drivers/i3c/master/dw-i3c-master.c b/drivers/i3c/master/dw-i3c-master.c
index 1c1418d0a62a..36afd8ff4e2f 100644
--- a/drivers/i3c/master/dw-i3c-master.c
+++ b/drivers/i3c/master/dw-i3c-master.c
@@ -1692,11 +1692,16 @@ static void dw_i3c_master_restore_addrs(struct dw_i3c_master *master)
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
