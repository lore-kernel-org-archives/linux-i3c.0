Return-Path: <SRS0=nhNj=RJ=lists.infradead.org=linux-i3c-bounces+linux-i3c=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EB4EEC43381
	for <linux-i3c@archiver.kernel.org>; Wed,  6 Mar 2019 21:57:21 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B816A20684
	for <linux-i3c@archiver.kernel.org>; Wed,  6 Mar 2019 21:57:21 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="eAaKJm6P";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="ORgfUW4o"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B816A20684
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=synopsys.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=DZQI6puNSvOkg2+NXVoS3x/jptWmaVyz+Zd1kCgnF2I=; b=eAa
	KJm6PYCoDFG7gwJmgya6rgLEPx80WyqtQ93TDN5bujOjBpkPtTASLIgsrmxr1Tj1osWbHpxuME/Ut
	Fwh1Q2PrYKNRjC2cMtnuYYinfV9tVPVkj+Yr1TBOTYreOHXTcCRnl2V/yGbPuhbj01FZYuY2hge6V
	C9LHWmwdkF8SYz+X+AMf+HFyI+XhJlYCx8PCWUUSx1GWC8eSp2la/zVNiX5N13nv+Vl2jhRuDxiWs
	rFEij1kl78OjFZIYUm+XxL9VYSLyJVGOojFYjvgPzdNir6WjKTjnU6IOH5n330zZ+ucHcu5wjrhJO
	Is8v58hZ49QIoiLvgCrn+uIs8THzjAg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h1eXR-0000p4-7l; Wed, 06 Mar 2019 21:57:21 +0000
Received: from smtprelay.synopsys.com ([198.182.60.111])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h1eXN-0000oT-Tb
 for linux-i3c@lists.infradead.org; Wed, 06 Mar 2019 21:57:19 +0000
Received: from mailhost1.synopsys.com (mailhost1.synopsys.com [10.12.238.239])
 by smtprelay.synopsys.com (Postfix) with ESMTP id 1B09C10C20DD;
 Wed,  6 Mar 2019 13:57:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1551909434; bh=MGIlj/YpOiJLaDKzdGfHFDyllFKgubVJa5MMit6voYs=;
 h=From:To:Cc:Subject:Date:From;
 b=ORgfUW4o4rKSKKW6hYjtCpmZKM8IQ54KqDSlHCqqLlGgkB9EUxlh1vQNU+tDYZXeN
 p7Gd58zXxWwvPLDgdZjGAWD73Vj6yALGpJ37hOQs+g5oinMvFfySeB8oQ0ezkMpJaO
 M+F/ooAmPOWyrR1YZUpVWSWsxkqFeeDBuB2bRRT9L07Sz6/EPAc/RIfNQEEAir3jak
 VDeEb82p6ridlWjl/if6XJms1kf6B+NVWFzqGn5YXRorDFTbEgv3hHl7kp7H+rLQHw
 BEIIwxYxETyIMA5NIoj197wXdUv/3eCGCnsByu0Gc4iAJ61ToiPtq64QzVhNYYzCHT
 hKgHlQh7WAx6w==
Received: from de02dwia024.internal.synopsys.com
 (de02dwia024.internal.synopsys.com [10.225.19.81])
 by mailhost1.synopsys.com (Postfix) with ESMTP id CBC5E5582;
 Wed,  6 Mar 2019 13:57:12 -0800 (PST)
From: Vitor Soares <vitor.soares@synopsys.com>
To: bbrezillon@kernel.org
Subject: [PATCH] i3c: master:dw: Fix dw_i3c_master_disable controller by using
 correct mask
Date: Wed,  6 Mar 2019 22:57:07 +0100
Message-Id: <9af6e8d204c7d846b727a9a010b79f1df7ecec1e.1551907779.git.vitor.soares@synopsys.com>
X-Mailer: git-send-email 2.7.4
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190306_135717_969008_C2F5D856 
X-CRM114-Status: UNSURE (   8.81  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-i3c@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: Linux I3C <linux-i3c.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-i3c>,
 <mailto:linux-i3c-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-i3c/>
List-Post: <mailto:linux-i3c@lists.infradead.org>
List-Help: <mailto:linux-i3c-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-i3c>,
 <mailto:linux-i3c-request@lists.infradead.org?subject=subscribe>
Cc: linux-i3c@lists.infradead.org, joao.pinto@synopsys.com,
 Vitor Soares <vitor.soares@synopsys.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org

The controller is disable by clear the DEV_CTRL_ENABLE bit rather
than set it. This is fixed by using the correct mask.

Fixes: 1dd728f5d4d4 ("i3c: master: Add driver for Synopsys DesignWare IP")
Signed-off-by: Vitor Soares <vitor.soares@synopsys.com>
---
 drivers/i3c/master/dw-i3c-master.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/i3c/master/dw-i3c-master.c b/drivers/i3c/master/dw-i3c-master.c
index bb03079..ec385fb 100644
--- a/drivers/i3c/master/dw-i3c-master.c
+++ b/drivers/i3c/master/dw-i3c-master.c
@@ -300,7 +300,7 @@ to_dw_i3c_master(struct i3c_master_controller *master)
 
 static void dw_i3c_master_disable(struct dw_i3c_master *master)
 {
-	writel(readl(master->regs + DEVICE_CTRL) & DEV_CTRL_ENABLE,
+	writel(readl(master->regs + DEVICE_CTRL) & ~DEV_CTRL_ENABLE,
 	       master->regs + DEVICE_CTRL);
 }
 
-- 
2.7.4


_______________________________________________
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
