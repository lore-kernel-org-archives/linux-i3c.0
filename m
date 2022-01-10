Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC6A2C433FE
	for <linux-i3c@archiver.kernel.org>; Mon, 10 Jan 2022 20:22:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=jtCXhYjHd+gRImVYlWrozC1kC3kCv7dlYj4DFbGsK0U=; b=OnwRaDi/g5lWvc
	G5liewoQWO26f9WhcGLLHepyCZWY1ZrCzYd6pZvvJDuUGavEyNe4WRO7BeUKx7eqz2SP6AIxNAlsM
	JyFIzEwdcysuCM1XulRBIvOZNnjs5XTyPUpqX66TcUVNgGMlj1+WUdjMuiU+rSCM7Cyf8oh7siKym
	wxN0tn53B7t0QlbaovJLkTGg110Bc9w/g8dsG94/uQbQXKdQTvsWtA5gz++5UQ18wn0/xiR0hL7Lw
	qlw3T3LYr89JDsFyRZM+zSCpgPtacrylffIVL3eMDbDgycWdfJEJM+0MHLKgRmb39/ba1mapU75ut
	u4Hp/uY2pEPaWdwcONxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n71Bf-00DDOZ-0N; Mon, 10 Jan 2022 20:22:39 +0000
Received: from mail-pg1-x534.google.com ([2607:f8b0:4864:20::534])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n6l6r-0091qj-4X
 for linux-i3c@lists.infradead.org; Mon, 10 Jan 2022 03:12:38 +0000
Received: by mail-pg1-x534.google.com with SMTP id 8so9983172pgc.10
 for <linux-i3c@lists.infradead.org>; Sun, 09 Jan 2022 19:12:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=W7ns24hJzFvAWvzuWZP01tC92QonI9qqQCzq/t0/f1M=;
 b=otV+dLdOwvWEhoQm6fhpqKPOzOR9Rlf/zPp84rmt8AnFiPn+leaB5/7XSk3piAh1tY
 KHVc5vPZJ3/5oq34YZX4WNWnjzA5MAKXeHcnhKux6LDhYIXFTWzIql6mNXgyezzfGTSc
 eQZyqzDTyZVZpSJHRZwO59FSlLTNu6TMC77m8Y1OOfiEf16s5vKtIVgvffAuhx+YNaiV
 Ky/lEv1nwRGdq9jLp5sYZTaQdSJTx0mVfDoCyZRfmnNn3DeXOktSkOTWPtypgaDBAXhA
 4wfoCDtRn22C1tcgetEnbzQw6725RoyKmSiqHDydTeRfPLNm/caB3f5yKyoFJPtRQkZ9
 dneQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=W7ns24hJzFvAWvzuWZP01tC92QonI9qqQCzq/t0/f1M=;
 b=kiQ6Z7GrxLkipcHEiIhkYeoSB8leZWH6buy3tUtKKqt5x6w2RUU+ggTDxlgeYOivrn
 bZAHjvPE6sT0JuWMtkJyhS+qUEgjXvgSwC/eSx/fH0g8d4gj8y5zalkgnu7YEpJ1CZsx
 hK1jUti4ZFmkNe6WnCFqwfenStyfPM5geTkrEdgVCJJogzByoewaiEEjlrZqEmToSHFB
 73tDRM7TusbeOqu4Ad+sGKA6mneQWI4CN9WsLupXSZTrwwylfLe9fZRFKiSa+y25Uksu
 HvH5fJM8pj4sb84tNIDTBJxU4fN/iy+ShdcOI6GCoHSeeFBkj3cV7FRnF6y0vTL8h4wJ
 S+jA==
X-Gm-Message-State: AOAM531DeRO0jt568JE7tHypS0WTJIldojzGiqtiCr/Ghbh+hgUug4mj
 k5K17Jc2wAuqvHeh04SRTaY/ZofyKfU=
X-Google-Smtp-Source: ABdhPJw+DGHzxP8RToh7xSngjP/J/B5PHI0KlFBymrn0VOeHGMEj1RRdRahyrp8dErb7wHYuVkrcdQ==
X-Received: by 2002:a63:4602:: with SMTP id t2mr65440282pga.108.1641784356099; 
 Sun, 09 Jan 2022 19:12:36 -0800 (PST)
Received: from localhost.localdomain ([193.203.214.57])
 by smtp.gmail.com with ESMTPSA id 93sm6974360pjo.26.2022.01.09.19.12.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 09 Jan 2022 19:12:35 -0800 (PST)
From: cgel.zte@gmail.com
X-Google-Original-From: deng.changcheng@zte.com.cn
To: miquel.raynal@bootlin.com
Cc: conor.culhane@silvaco.com, alexandre.belloni@bootlin.com,
 linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org,
 Changcheng Deng <deng.changcheng@zte.com.cn>,
 Zeal Robot <zealci@zte.com.cn>
Subject: [PATCH] i3c: master: remove unneeded variable
Date: Mon, 10 Jan 2022 03:12:31 +0000
Message-Id: <20220110031231.644805-1-deng.changcheng@zte.com.cn>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220109_191237_207716_0F20B353 
X-CRM114-Status: GOOD (  10.18  )
X-Mailman-Approved-At: Mon, 10 Jan 2022 12:22:37 -0800
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

From: Changcheng Deng <deng.changcheng@zte.com.cn>

Remove unneeded variable used to store return value.

Reported-by: Zeal Robot <zealci@zte.com.cn>
Signed-off-by: Changcheng Deng <deng.changcheng@zte.com.cn>
---
 drivers/i3c/master/svc-i3c-master.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/i3c/master/svc-i3c-master.c b/drivers/i3c/master/svc-i3c-master.c
index 7550dad64ecf..d6e9ed74cdcf 100644
--- a/drivers/i3c/master/svc-i3c-master.c
+++ b/drivers/i3c/master/svc-i3c-master.c
@@ -1597,12 +1597,11 @@ static int __maybe_unused svc_i3c_runtime_suspend(struct device *dev)
 static int __maybe_unused svc_i3c_runtime_resume(struct device *dev)
 {
 	struct svc_i3c_master *master = dev_get_drvdata(dev);
-	int ret = 0;
 
 	pinctrl_pm_select_default_state(dev);
 	svc_i3c_master_prepare_clks(master);
 
-	return ret;
+	return 0;
 }
 
 static const struct dev_pm_ops svc_i3c_pm_ops = {
-- 
2.25.1


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
