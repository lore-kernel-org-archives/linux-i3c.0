Return-Path: <SRS0=1QaF=WS=lists.infradead.org=linux-i3c-bounces+linux-i3c=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D9DD4C3A5A1
	for <linux-i3c@archiver.kernel.org>; Thu, 22 Aug 2019 14:22:02 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9F337233FD
	for <linux-i3c@archiver.kernel.org>; Thu, 22 Aug 2019 14:22:02 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="GN0LqliF";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=ingics-com.20150623.gappssmtp.com header.i=@ingics-com.20150623.gappssmtp.com header.b="AUF9nXfi"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9F337233FD
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ingics.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Ge2yyK/202Q69J9H0JoE5+uiBuGbhGwPbdclpnMszh0=; b=GN0LqliF1QtpGf
	TZhOZp0FrFh5PIAtNeplFNYcYMS1FEyRwpKtSF+Sv2lRJTew20iyzffjbLr/e8rvLYoBbnwmCqhpb
	k7PHkzoAUv36npGSwjk+H2rJZzBomEZYQpev+Bq3ivs90boQhzW0gh03rA9RoM/9ERD+XNy8E29f/
	8UvBV60z8hN/Bk5VnjqTGySLA6uPbKmW2or9jiptMxMtnZYQ4O1K6EvMccEHuXeKEzbVqZDe5vZfC
	He68hKpGNNZqXOtp54nq0g7CH4umGmCkFTHE83wQSIAWWxNBM/6yfYPtyQ+TsAHxQkO/HuoOmuEcl
	lC6S41HXx5PhK7bFloNA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1i0nyU-0000wL-7l; Thu, 22 Aug 2019 14:22:02 +0000
Received: from mail-pf1-x444.google.com ([2607:f8b0:4864:20::444])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hyWLk-000507-Ep
 for linux-i3c@lists.infradead.org; Fri, 16 Aug 2019 07:08:37 +0000
Received: by mail-pf1-x444.google.com with SMTP id w16so2667911pfn.7
 for <linux-i3c@lists.infradead.org>; Fri, 16 Aug 2019 00:08:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ingics-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=JUMUZcob84f0e2jFptSOnFkTdtMpnI1uLzH0W5R65Qc=;
 b=AUF9nXfiuT/6J8rVlIemwuQWuYGzV7XL5GKHrx7TNdRGDy2NRYq6oGSSxkTUpdnRzh
 plXXQfBEmY1yw9UcbHOA8vOsrO3zl+yReRnLnKYZy0DNE8YIn8j8Yd0GBZ7psnvbRpdY
 6Uawx9nBQwQilmMFckGr8QruIN9/EtacNRUK65G25U+7/DCdriVBNX93Z868CwM4MNRs
 QLV0rnn5O+HvazJ+4I9oMlCOUcsx6U3VTW8Um4Tu//X2HcFb1nxAfbIb21M7FyNvFPtl
 GvOK4WUMT/b5hQzBZCKxK6/vakX18r2QApOBbU/Zzrv9WLzlsWXa8iegq1o6GepRAU4z
 yBcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=JUMUZcob84f0e2jFptSOnFkTdtMpnI1uLzH0W5R65Qc=;
 b=iQ2mNIVJTFmlNu4YO4+tJeMxwKBrZ9XiexNYT7cwiXE17Tz9hMq2acTZATAxEIfxXJ
 CwlVu/9tgAuFwjihXZCnbc1jyeNAjvBImIXr+Z0S6hZCYp9CuOSPibMySz6gV5bx2X/Y
 W1v3Cb244jMqaJxDt2kVJn6ejFXFoSUeizwWhKwYVFca+vRIDHE8g0e9lMBiP78UUJ/s
 t4AzN17k99KQSBElw7wForV+dZhFJfvRVXX/pTDZfXQRHLWakeV1RuuP7AGXugk5fbCM
 rpF5h6OXcuXM4YJNCV3i+Wqd4L/AzidDqsXaIKifjdCK17n27PL9vBhcQsaqMf04c85O
 yHGg==
X-Gm-Message-State: APjAAAWrnUALT+DvlbVooRwewo15u3K/9nxj4eWP6kq9eQzfKm35Na5p
 Xejrgm2vcr3nbUGmleAmg2Ce6A==
X-Google-Smtp-Source: APXvYqy+5plMxV2ujL10uFZ0fxmzM04VulLJ7XgmP7Hh4ly1Wx29tWAxrDVRGWiApIDBD6U3JLBb0g==
X-Received: by 2002:a62:5207:: with SMTP id g7mr840686pfb.152.1565939314929;
 Fri, 16 Aug 2019 00:08:34 -0700 (PDT)
Received: from localhost.localdomain (122-117-179-2.HINET-IP.hinet.net.
 [122.117.179.2])
 by smtp.gmail.com with ESMTPSA id w11sm5161746pfi.105.2019.08.16.00.08.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Aug 2019 00:08:34 -0700 (PDT)
From: Axel Lin <axel.lin@ingics.com>
To: Boris Brezillon <bbrezillon@kernel.org>
Subject: [PATCH] i3c: master: Use dev_to_i3cmaster()
Date: Fri, 16 Aug 2019 15:08:25 +0800
Message-Id: <20190816070825.5411-1-axel.lin@ingics.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190816_000836_561432_C257BFF5 
X-CRM114-Status: UNSURE (   8.60  )
X-CRM114-Notice: Please train this message.
X-Mailman-Approved-At: Thu, 22 Aug 2019 07:22:01 -0700
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
Cc: linux-i3c@lists.infradead.org, Axel Lin <axel.lin@ingics.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org

Since we have dev_to_i3cmaster() available, use it.

Signed-off-by: Axel Lin <axel.lin@ingics.com>
---
 drivers/i3c/master.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/i3c/master.c b/drivers/i3c/master.c
index 8ff527263f46..5c051dba32a5 100644
--- a/drivers/i3c/master.c
+++ b/drivers/i3c/master.c
@@ -123,7 +123,7 @@ static struct i3c_dev_desc *dev_to_i3cdesc(struct device *dev)
 	if (dev->type == &i3c_device_type)
 		return dev_to_i3cdev(dev)->desc;
 
-	master = container_of(dev, struct i3c_master_controller, dev);
+	master = dev_to_i3cmaster(dev);
 
 	return master->this;
 }
-- 
2.20.1


_______________________________________________
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
