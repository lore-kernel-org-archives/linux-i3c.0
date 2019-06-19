Return-Path: <SRS0=zVsY=US=lists.infradead.org=linux-i3c-bounces+linux-i3c=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 26357C31E5D
	for <linux-i3c@archiver.kernel.org>; Wed, 19 Jun 2019 18:36:54 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0469E21734
	for <linux-i3c@archiver.kernel.org>; Wed, 19 Jun 2019 18:36:53 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="dRe6UY4H";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="M7B34DN6"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0469E21734
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=synopsys.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=7jZpOYqHX4LLH422pPJNum9+w5w7Oa9z3HPTITH0sLk=; b=dRe6UY4HXzLjh+kfcxGAU7QWBP
	M3+Yr6oC9HJ5GVNP6fMzFTRaBYr1CwYugp1iheC+zE+6dgA8Hf3X7xo2Yt4HZ9z/8UaHZfssCnHO0
	3bEnWXy8lV8lDmFvjCW5OjMQbR+09o7hcGMGQcsrRf+pfgmx5QmA0v4V9echUiyh5w89GotX1Ez7Q
	i6P0Vh7yJTDhiJY2kV3KULYdjSMGZ8POAs0AKkcKytQYH4cchqLHiLQCHZPyG7qNzjN3KkAIfszv9
	d71jyowbvbaCOHutCdaOxSOJ8O/v+LVkb10C4Z7e+SwHhdaQAXecFXitD2oFQGd8T2Tdo8ZZh5z4Z
	aLZ+9bTQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hdfS1-0005wm-Cj; Wed, 19 Jun 2019 18:36:53 +0000
Received: from dc8-smtprelay2.synopsys.com ([198.182.47.102]
 helo=smtprelay-out1.synopsys.com)
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hdfRy-0005ui-9S
 for linux-i3c@lists.infradead.org; Wed, 19 Jun 2019 18:36:51 +0000
Received: from mailhost.synopsys.com (mdc-mailhost1.synopsys.com
 [10.225.0.209])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 91AA7C0CAF;
 Wed, 19 Jun 2019 18:36:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1560969408; bh=wuJso1hif5l+TevIvXSskXT7xugWbLyyyXYKC8aX+1k=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:In-Reply-To:
 References:From;
 b=M7B34DN6cpwZaD9kNltLdZxt93WgCPJrq5KPIU7CkwC0Pd6auNAse1s0zDm5K1Fh4
 xNrPKE6DMP4NFsCrAuKUcTTAMxznXl8lwK/u/BgafjlaaqFEDdT8eLfQrWGWxLBy1p
 /JjPtp6LPF5cQNEpkVbkOoLR0dOiUmxmuEgzu4EZo1DwjmDfvI73v58o48SXWasqDt
 qUMwxF+YgHygoCPMMYvb9FzcF+gTE1MST4bOjc/I689Z8ZohrPEWokZ92V+GIjNWD4
 k+c6iy4geXZgarVdWzX+wQiBOeNujoZYenADu3qEraBN1i+ffxY6L8UZ+4eoxEWtx2
 +LBA0tjkwzXTQ==
Received: from de02.synopsys.com (de02.internal.synopsys.com [10.225.17.21])
 by mailhost.synopsys.com (Postfix) with ESMTP id 11BA5A0064;
 Wed, 19 Jun 2019 18:36:45 +0000 (UTC)
Received: from de02dwia024.internal.synopsys.com
 (de02dwia024.internal.synopsys.com [10.225.19.81])
 by de02.synopsys.com (Postfix) with ESMTP id B39D83F21A;
 Wed, 19 Jun 2019 20:36:45 +0200 (CEST)
From: Vitor Soares <Vitor.Soares@synopsys.com>
To: linux-i3c@lists.infradead.org, Joao.Pinto@synopsys.com
Subject: [PATCH v4 3/3] i3c: dw: add limited bus mode support
Date: Wed, 19 Jun 2019 20:36:33 +0200
Message-Id: <10b810c9afa9f06515b52a8fd580720f239e0a99.1560968688.git.vitor.soares@synopsys.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1560968688.git.vitor.soares@synopsys.com>
References: <cover.1560968688.git.vitor.soares@synopsys.com>
In-Reply-To: <cover.1560968688.git.vitor.soares@synopsys.com>
References: <cover.1560968688.git.vitor.soares@synopsys.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190619_113650_356497_F401645D 
X-CRM114-Status: GOOD (  10.14  )
X-BeenThere: linux-i3c@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux I3C <linux-i3c.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-i3c>,
 <mailto:linux-i3c-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-i3c/>
List-Post: <mailto:linux-i3c@lists.infradead.org>
List-Help: <mailto:linux-i3c-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-i3c>,
 <mailto:linux-i3c-request@lists.infradead.org?subject=subscribe>
Cc: Boris Brezillon <bbrezillon@kernel.org>, linux-kernel@vger.kernel.org,
 Vitor Soares <Vitor.Soares@synopsys.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org

This patch add limited bus mode support for DesignWare i3c master

Signed-off-by: Vitor Soares <vitor.soares@synopsys.com>
Cc: Boris Brezillon <bbrezillon@kernel.org>
Cc: <linux-kernel@vger.kernel.org>
---
Changes in v4:
  None

Changes in v3:
  None

Changes in v2:
  None

 drivers/i3c/master/dw-i3c-master.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/i3c/master/dw-i3c-master.c b/drivers/i3c/master/dw-i3c-master.c
index 1d83c97..9612d93 100644
--- a/drivers/i3c/master/dw-i3c-master.c
+++ b/drivers/i3c/master/dw-i3c-master.c
@@ -599,6 +599,7 @@ static int dw_i3c_master_bus_init(struct i3c_master_controller *m)
 
 	switch (bus->mode) {
 	case I3C_BUS_MODE_MIXED_FAST:
+	case I3C_BUS_MODE_MIXED_LIMITED:
 		ret = dw_i2c_clk_cfg(master);
 		if (ret)
 			return ret;
-- 
2.7.4


_______________________________________________
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
