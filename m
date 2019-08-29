Return-Path: <SRS0=0Lh8=WZ=lists.infradead.org=linux-i3c-bounces+linux-i3c=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8ACACC41514
	for <linux-i3c@archiver.kernel.org>; Thu, 29 Aug 2019 10:20:15 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 60CF223405
	for <linux-i3c@archiver.kernel.org>; Thu, 29 Aug 2019 10:20:15 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="b4t/QfJ1";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="QVJpf1sL"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 60CF223405
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=synopsys.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=Vos2Tu54DXo3lGgln8liuzUro9XWaOsWwGuKpMNR9hk=; b=b4t/QfJ19TlIJWyb+xQNRU7S0/
	4iit84lp0PeGUWGsOqLDBsWBIA1dNJT2jcAxkx2uSa+5dgFU24QiYus2E4/Dkn9VpIJuaHwNS8QGC
	57xkogl4SREoCxF8KoSxz70VGo8g6XFxvFkQ6YnZ0u37AmLtAYZGiFF9JzVHq08rbDnrZPf9huxRp
	SN0Q+198k4+xxfqIDmsNzByMWjoYtqEYNguQeVqTeK/cYRo2mcFS90Zibih7O7pkMU0FEmPdyFH1D
	h4umUqVm2NfCgYfJsCjHkuIz9YjJZXBZPMCss6Lq+A3CgV9cjan9hcl/8ei0dstYDk3fj0QWUviK9
	cPKS6NmA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1i3HXI-0006Yq-GK; Thu, 29 Aug 2019 10:20:12 +0000
Received: from dc2-smtprelay2.synopsys.com ([198.182.61.142]
 helo=smtprelay-out1.synopsys.com)
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1i3HWp-00054d-Ui
 for linux-i3c@lists.infradead.org; Thu, 29 Aug 2019 10:19:45 +0000
Received: from mailhost.synopsys.com (mdc-mailhost2.synopsys.com
 [10.225.0.210])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 0FC50C038D;
 Thu, 29 Aug 2019 10:19:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1567073980; bh=FlHiWTvjjWp92vQF4e0yCZ0JuIXNBAhd+K3GIva9RJg=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:In-Reply-To:
 References:From;
 b=QVJpf1sLq+rfJ8rhKJNfxOMIiM0OrL7JRc4PRug5hYDZb8XJTJ8y/5n7FLPC7FUHb
 dpe0zoiIKN9qRcex+kxoIwk3M/2FnA9yMRusnzLobmeUQKLVzlBidZ1m8lIvCYrCuF
 wJfwEr1qpW8fg5VLVhqkG6+lKwhkK9h1UBrfnyWpEvFP3eyH2op32RsyXbl7DScYfS
 9Dh7+FqvjJ4wtuAeqsxIjyyhm00rUEm2bgFLiPqNQ0DcecSAvJAwn2q/31tjNeGN7C
 CiU2qliVIaqcXUnoBPaKbputLw1IgiT1GlwWHvC+VLbC8Kjben9JZrf+vnj3GCRDyu
 uws2mUAWl1bPw==
Received: from de02.synopsys.com (de02.internal.synopsys.com [10.225.17.21])
 by mailhost.synopsys.com (Postfix) with ESMTP id 7F6E0A0065;
 Thu, 29 Aug 2019 10:19:38 +0000 (UTC)
Received: from de02dwia024.internal.synopsys.com
 (de02dwia024.internal.synopsys.com [10.225.19.81])
 by de02.synopsys.com (Postfix) with ESMTP id 53B8F3B651;
 Thu, 29 Aug 2019 12:19:38 +0200 (CEST)
From: Vitor Soares <Vitor.Soares@synopsys.com>
To: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-i3c@lists.infradead.org
Subject: [PATCH 4/4] i3c: master: dw: reattach device on first available
 location of address table
Date: Thu, 29 Aug 2019 12:19:35 +0200
Message-Id: <e03fb41054a8431b27cc84c3d83ada9464172ef7.1567071213.git.vitor.soares@synopsys.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1567071213.git.vitor.soares@synopsys.com>
References: <cover.1567071213.git.vitor.soares@synopsys.com>
In-Reply-To: <cover.1567071213.git.vitor.soares@synopsys.com>
References: <cover.1567071213.git.vitor.soares@synopsys.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190829_031944_094176_9811343C 
X-CRM114-Status: UNSURE (   9.90  )
X-CRM114-Notice: Please train this message.
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
Cc: mark.rutland@arm.com, Joao.Pinto@synopsys.com, robh+dt@kernel.org,
 Vitor Soares <Vitor.Soares@synopsys.com>, bbrezillon@kernel.org
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
---
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
