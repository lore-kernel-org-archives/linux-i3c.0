Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD878C79FA0
	for <linux-i3c@archiver.kernel.org>; Sun,  6 Sep 2026 20:29:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=erbFmMi/nvoQZ3ec5HRMiuF0CB3CzexEV0uH96PH/f4=; b=McDW/TxMajsxpjmXFxTfNQXacA
	GJQamokOL6LkkknpLDnuY4/pMZcW+vrKbgJTngqH21sA2OPKd4Gk+bvipYER+FSvKM4mb6q2OJsr0
	a/Mxu/nQss5C7zRdgfd+CQ0Qw48jhbu/+eCWK/PSGyBqo5VfkhGA+NuY2yfy1nMu2an2VXsiaaOIi
	Uca4J9pfC7jpPGvC4UmQmJZjlQkWrzxOSIsVUyT582/R/oft3K65PZLm/Kn/YFVvHnwVD9QjLbCg3
	wLIJJ7xs7VQqZ5gLg2brGPKUiARZAmFYh1n6sK8eoRCBEUFaQ23BmDczW2VOzJElBBn4AONHk7xnf
	jn1qzryw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3JUK-00000005YNq-1Vwb;
	Sun, 06 Sep 2026 20:29:16 +0000
Received: from mail-pj1-x1048.google.com ([2607:f8b0:4864:20::1048])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3JUG-00000005YMB-1eJZ
	for linux-i3c@lists.infradead.org;
	Sun, 06 Sep 2026 20:29:15 +0000
Received: by mail-pj1-x1048.google.com with SMTP id 98e67ed59e1d1-38dbf293831so6039355a91.3
        for <linux-i3c@lists.infradead.org>; Sun, 06 Sep 2026 13:29:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788726551; x=1789331351; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VbF+m1IWNGHjplX/XAIe8nP/a/sFZGH0R//WnioyHCM=;
        b=dWbgvp3gQM6btcKM07G7EZpQguxua6ms8gIdqkbYwRWc2/6K2AHPWSOZOVYnHcC9wd
         7LvgqdPoLYHo9qaMJNBVscyII1ZhAq32OlBEpaUGSeL6wkEtDCi0u24XNoXrdmLsn6CK
         E5Zm0BMi5rOUVGjjxTWkaDHp2JBHbGgHzNZEtibUQu1uLyrS4+UZPWXgVovDTOAXbN22
         sKVaiXc40X3WPFpZZh1klQSG6PEwJEXa+USgcKMKZyAVrDC5L7Cs5eYniCu3qyuO0YCh
         lJb4P6xme93Fpfp9yRcaPUp+mpqLEA+mxJuV0pnLEyJlr2AOMHuCgArqZHrFkHqek6zN
         grXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788726551; x=1789331351;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VbF+m1IWNGHjplX/XAIe8nP/a/sFZGH0R//WnioyHCM=;
        b=khs4cqJR2l/cQ7D8aqaH7iADDk6OKMKJGY/iaAIxvJY4/c9dLhsAawvVetc2yWDkaA
         89ghY3Ha7v82TZrov6kZ01tc6FZKbavDPjx+SDcrZlLb410kgJ2WD9MWeABPDXsqTq3Q
         KRxtK+tmYwP+5wDh1FIKnmLwfwJnL9M3Qz+P99tT/Py+vgUUXzyh4+/BkugnhNR6/P+B
         i2p00nVeCv0PqN1t1S1XlhVkAADExxpFyPzJpyJSPXonRFHkN14q6jYGVO7YyKU9pxbr
         I067QexB8yey7C56I96SsCzvwxZN2enuL1LNfBIwxMmQFBMRk3joO7Cxe77YDj82fw04
         DlNA==
X-Gm-Message-State: AFuF++m/mA7C+2zgjKB54zY2u9NcqtSl4P4lfPJCIBsEyreCvakQjWEo
	dVB9U4z5x9bvvfaaZv/mW7y07WldYkgDkoMrf+4tu3nIMeqIKjDo8wvRH0O6xLzqD+v6hP2+Xfg
	yyzQ2tG7Whu+pDkla3i2/D7whROiYbHmzTGog00sZ2YU51cmEhyWXf7+arHkocmDiQ6jQ4otKu2
	H40NvHU0vARUEAJPMcW+4wuQ5rEd8FOmwS7rXt+whFU283k9Qazp0giCBhPLqN7oWLqQzP3uBqK
	o6e0w==
X-Received: from dybvt2.prod.google.com ([2002:a05:7301:78c2:b0:32f:1c5c:c8a5])
 (user=samagazaryan job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:90b:28cc:b0:36d:b424:4f17 with SMTP id 98e67ed59e1d1-39b260e13d5mr28750188a91.1.1788726550262;
 Sun, 06 Sep 2026 13:29:10 -0700 (PDT)
Date: Sun,  6 Sep 2026 20:27:45 +0000
In-Reply-To: <20260906202747.4041389-1-samagazaryan@google.com>
Mime-Version: 1.0
References: <20260906202747.4041389-1-samagazaryan@google.com>
X-Mailer: git-send-email 2.55.0.979.g7e5102b832-goog
Message-ID: <20260906202747.4041389-2-samagazaryan@google.com>
Subject: [PATCH v4 1/3] i3c: master: export i3c_masterdev_type
From: Sam Agazaryan <samagazaryan@google.com>
To: linux-i3c@lists.infradead.org
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>, Frank Li <Frank.Li@nxp.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Arnd Bergmann <arnd@arndb.de>, 
	Vitor Soares <vitor.soares@toradex.com>, 
	Oleksandr Shulzhenko <oleksandr.shulzhenko.viktorovych@intel.com>, linux-kernel@vger.kernel.org, 
	Sam Agazaryan <samagazaryan@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260906_132912_430032_BF46473E 
X-CRM114-Status: GOOD (  10.43  )
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

From: Vitor Soares <vitor.soares@toradex.com>

Export i3c_masterdev_type so i3cdev module can verify if an i3c device
is a master.

Signed-off-by: Vitor Soares <vitor.soares@toradex.com>
Signed-off-by: Sam Agazaryan <samagazaryan@google.com>
---
 drivers/i3c/internals.h | 2 ++
 drivers/i3c/master.c    | 3 ++-
 2 files changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/i3c/internals.h b/drivers/i3c/internals.h
index 86a36b951e0d..cbc00c862104 100644
--- a/drivers/i3c/internals.h
+++ b/drivers/i3c/internals.h
@@ -11,6 +11,8 @@
 #include <linux/i3c/master.h>
 #include <linux/io.h>
 
+extern const struct device_type i3c_masterdev_type;
+
 int __must_check i3c_bus_rpm_get(struct i3c_bus *bus);
 void i3c_bus_rpm_put(struct i3c_bus *bus);
 bool i3c_bus_rpm_ibi_allowed(struct i3c_bus *bus);
diff --git a/drivers/i3c/master.c b/drivers/i3c/master.c
index afcd7a21a3e6..e8a9f8c3041e 100644
--- a/drivers/i3c/master.c
+++ b/drivers/i3c/master.c
@@ -864,9 +864,10 @@ static void i3c_masterdev_release(struct device *dev)
 	i3c_master_free_i3c_dev(master->this);
 }
 
-static const struct device_type i3c_masterdev_type = {
+const struct device_type i3c_masterdev_type = {
 	.groups	= i3c_masterdev_groups,
 };
+EXPORT_SYMBOL_GPL(i3c_masterdev_type);
 
 static void i3c_master_shutdown(struct i3c_master_controller *master)
 {
-- 
2.55.0.979.g7e5102b832-goog


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
