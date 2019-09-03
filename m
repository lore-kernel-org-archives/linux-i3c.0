Return-Path: <SRS0=vbyI=W6=lists.infradead.org=linux-i3c-bounces+linux-i3c=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 91A69C3A5A5
	for <linux-i3c@archiver.kernel.org>; Tue,  3 Sep 2019 10:36:09 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 678332168B
	for <linux-i3c@archiver.kernel.org>; Tue,  3 Sep 2019 10:36:09 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ahTeN2rs";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="GniHgZu+"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 678332168B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=synopsys.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=XWA7NHio8r41Q4SLez7bKopvlfWvhNAWt2EMjnlOhiw=; b=ahTeN2rsepUwd9GnVCR99QY8kz
	LUbSX0nG4SzaTZywKewVmMbWQoXS864Od9N+3Tau+8wffya2irKIJmFFeLwhDc15xfA4zVOodbBjN
	7NPYrn3/RSnBeBNLVQKGUXymulrOK+xAWBKWKgvNV5+P86xuygMTJkwqjkHJcgrodonFfdxd20/f9
	hn2CzZZIJFRGP/2QqQ1sitmxJyt4qMVKY4rFHgAj4T1uHs3RzGkeCOhpkNW7knYth22IpmOdAchH9
	MHKQddqh07QDBaFTG9pN2bwl3tLDNRW8/dChqSKhYBs3tiKlYHooztLVW8UY6WZVoK0R/SOaJbiCc
	KIbGeCvg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1i56AT-0008DX-0Z; Tue, 03 Sep 2019 10:36:09 +0000
Received: from dc2-smtprelay2.synopsys.com ([198.182.61.142]
 helo=smtprelay-out1.synopsys.com)
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1i56AP-00089n-Vh
 for linux-i3c@lists.infradead.org; Tue, 03 Sep 2019 10:36:07 +0000
Received: from mailhost.synopsys.com (mdc-mailhost1.synopsys.com
 [10.225.0.209])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 562C2C0416;
 Tue,  3 Sep 2019 10:35:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1567506960; bh=wcWwratgm8ehYW75XaHQWAIMPGVfnICMKiObM27MCu0=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:In-Reply-To:
 References:From;
 b=GniHgZu+adDcfTGlIjdjxgpPuaMK3KYAHngpYsl8jlO+u2gWCty2+hLXDbsv5j1fs
 qFZ5QPKuDJy5vGhQVlHqDcCmleIOkYf4zeEWtA0PWyutbUt0E4k/yOxa9Tu9itLS3n
 HMx40mPjd84uM+rHlgDeKoj+cJ6avEUoouCB0HafmRJyxobd8Mu1XSDMeP78Uxl49h
 SZvAZHsaDZ9OfMohgLXOW4pQWoFUpK7JJTmu9tzZWQjDg4o61ZHsMqw5x6571uBAGp
 MR/HJUoLNRTAltgR0/1WTYtp/KFEqg3UlxXGGsMrRqstY5GPhg7ivV8lfQKgefkvjA
 3GoaWeBRxqorQ==
Received: from de02.synopsys.com (germany.internal.synopsys.com [10.225.17.21])
 by mailhost.synopsys.com (Postfix) with ESMTP id 212D3A006A;
 Tue,  3 Sep 2019 10:35:57 +0000 (UTC)
Received: from de02dwia024.internal.synopsys.com
 (de02dwia024.internal.synopsys.com [10.225.19.81])
 by de02.synopsys.com (Postfix) with ESMTP id E55A93C0E4;
 Tue,  3 Sep 2019 12:35:56 +0200 (CEST)
From: Vitor Soares <Vitor.Soares@synopsys.com>
To: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-i3c@lists.infradead.org
Subject: [PATCH v2 5/5] i3c: master: dw: reattach device on first available
 location of address table
Date: Tue,  3 Sep 2019 12:35:54 +0200
Message-Id: <594bce70368177256376fc2f592736db78cf40db.1567437955.git.vitor.soares@synopsys.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1567437955.git.vitor.soares@synopsys.com>
References: <cover.1567437955.git.vitor.soares@synopsys.com>
In-Reply-To: <cover.1567437955.git.vitor.soares@synopsys.com>
References: <cover.1567437955.git.vitor.soares@synopsys.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190903_033606_021198_C38BE03A 
X-CRM114-Status: GOOD (  10.61  )
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
Cc: mark.rutland@arm.com, Joao.Pinto@synopsys.com, bbrezillon@kernel.org,
 Vitor Soares <Vitor.Soares@synopsys.com>, pgaj@cadence.com, robh+dt@kernel.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org

For today the reattach function only update the device address on the
controller.

Update the location to the first available too, will optimize the
enumeration process avoiding additional checks to keep the available
positions on address table consecutive.

Signed-off-by: Vitor Soares <vitor.soares@synopsys.com>
Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>
---
Change in v2:
  - Add Boris rb-tag

 drivers/i3c/master/dw-i3c-master.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/drivers/i3c/master/dw-i3c-master.c b/drivers/i3c/master/dw-i3c-master.c
index 1d83c97..62261ac 100644
--- a/drivers/i3c/master/dw-i3c-master.c
+++ b/drivers/i3c/master/dw-i3c-master.c
@@ -898,6 +898,22 @@ static int dw_i3c_master_reattach_i3c_dev(struct i3c_dev_desc *dev,
 	struct dw_i3c_i2c_dev_data *data = i3c_dev_get_master_data(dev);
 	struct i3c_master_controller *m = i3c_dev_get_master(dev);
 	struct dw_i3c_master *master = to_dw_i3c_master(m);
+	int pos;
+
+	pos = dw_i3c_master_get_free_pos(master);
+
+	if (data->index > pos && pos > 0) {
+		writel(0,
+		       master->regs +
+		       DEV_ADDR_TABLE_LOC(master->datstartaddr, data->index));
+
+		master->addrs[data->index] = 0;
+		master->free_pos |= BIT(data->index);
+
+		data->index = pos;
+		master->addrs[pos] = dev->info.dyn_addr;
+		master->free_pos &= ~BIT(pos);
+	}
 
 	writel(DEV_ADDR_TABLE_DYNAMIC_ADDR(dev->info.dyn_addr),
 	       master->regs +
-- 
2.7.4


_______________________________________________
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
