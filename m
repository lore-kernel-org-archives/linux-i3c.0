Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 073D0FB5EA8
	for <linux-i3c@archiver.kernel.org>; Tue, 17 Mar 2026 03:40:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=DnbL8ChizgZOfG9flaY9n4QRLmO/KNkq6Rw9mqcpcOc=; b=AciD7YaGC57+Wl
	XTg8wl/KmK+PEvpVgdAXTYsPAJlm9SAXZC7u7G/4BYGUnl9WXD6fMQeU/2tu/12VVMY6+c6IBwXdW
	p2LYQB590REfiyygIiY2K4YHrd2oJJsAQZmW+w4BPF3+T6SzNMJDsSufNQEzUQQlbKVEDJ1bYQnZ2
	5DAtX05xKSnzfPKRJOWyCUSRfo43Lvvw9tthFBh2gLsObl1+bDHqeHYkJ9h9g0JEUdi8QMlajwCZK
	qePQaGs/MInhc2Kdd1i+rIzg9kaM0VCdwdpVVM3iKq15p6LDiwoWFPWl79DlfNANvyx8TeKecM1u1
	wN6J+xaSHFQM8s2Xx4mQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2LI9-00000005Kv7-364s;
	Tue, 17 Mar 2026 03:40:25 +0000
Received: from mail-pg1-x534.google.com ([2607:f8b0:4864:20::534])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2LI7-00000005Kun-2bwO
	for linux-i3c@lists.infradead.org;
	Tue, 17 Mar 2026 03:40:24 +0000
Received: by mail-pg1-x534.google.com with SMTP id 41be03b00d2f7-c7358a7a8d1so3720482a12.3
        for <linux-i3c@lists.infradead.org>; Mon, 16 Mar 2026 20:40:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773718822; x=1774323622; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=0e4a1XqGu8pWFSZImA7ilBed018RbSnXlZrAKGDX89A=;
        b=DwyRyjf693M3aIDEuTsH/QaOg4ULHl1mmWgK8agHUzDLoiIUFY3ChJN0ODa54Grttp
         y7ecVcgOn+jjm0qaVG29wAnTZGxbjBI/q3a8qXiqsb1+HKiQq5WeKXqc25yIe4fLXZuc
         7MHln2eqMn168zkfQdzqzcugOkRPXoUf8jvkfR8hDOn3l4EZyyDThSaSmbs8FAzMKmOX
         xDQgblQWl7/F3Ow3LZSf4hbAGfhl9ByCqtmEypEWm5a4BrlZSS8/ltFOj+W0NBzOuXeb
         P53DWPyqjIPrBqYP1Xgctnom4UuLpCBGP8IbexrSCeJYeSBEVBHNNsaC4OPLqhuhPari
         LTPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773718822; x=1774323622;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0e4a1XqGu8pWFSZImA7ilBed018RbSnXlZrAKGDX89A=;
        b=CxnOCMLW6Lb/rOMXdTB/wiJLmGoVaWsqCNUYEDlqLsa4vuwFSDuXriV9W0ZRAXnNdw
         RBwbQIfoFkQ2N5yR/6Zps7NilITu4NDh/7vNW9LkVOJhPjo+k2hMF+ht6ry99bs7WlDS
         Rdv9J16BYJs9UMcQE5efxkfALNvltv3cbcsvZRTcl8+82G8tIe/Yle6JKU0bkU9C1Tqa
         JT2HHmutCD9vIL5INIFXUsEGQKLpa23Q44H3+kmMYx8y5aZH+ucD5q/AF3sQ00OJaiha
         S5wRlYvyZN6ovqyEkpXdPT+b9mxwO3EG0r+2sYmubP3Av6OAFYnPhAe53WZ5V48fKAkq
         m3Ig==
X-Forwarded-Encrypted: i=1; AJvYcCXN7my57jqBNpUDmdYCYluL0uKmDJN0WEY2QrGxkWlXG0uLDnMujNN/b30EIPLOs2vmH+m2GIX4ZOw=@lists.infradead.org
X-Gm-Message-State: AOJu0Yy59QB1gV5vl7MxEcJFUd/WvMhkQwu7++yQvs81H4nHVqDIkbQY
	bAiYvfZaSMyWKuOuvwkWTtZtdcacUargSi0ABiRfmwu9Rd9UuSyCYWtd
X-Gm-Gg: ATEYQzxfnCj/dX8iVd96r/hdqBF58x8T44I7eJhzGYBfqQEYbncAByv5Z4T76YjN1ea
	ytQ4Yp2LEmzODfhKv6+DROX1L36JzAOzIrdHWmBfW8QYuvlf7OgBJmAZ2N8LoxQIy26TrjEifwQ
	Fx/Zx0NER0QE55XDSsiXvaQpi5UGw/r1yt8pnm0W42ri2wAR2sU1TFN1opgZVHAP449/zEjOhCX
	tAzFPoNzuIKIsdN6lRAxr2Alo/pSd7nHd3HJc3Kioy8kTzxmAnifrn+jyW9B8LJpbCh/MPk+R8i
	Q3G8hndNGHsX0yzQTxNeEKm67/Io2ktVveZ9KTKyHuU0XIhBBUGnKYMVHp2w05NOLw3G+GWpGgt
	haM8Fpo3Q747B0H8jmeaPRIPOh7Iosy12YoWGQP/ozJ8Bn2TnJYwDUEmTLutmLNDvEV4NliVzQN
	AIvvDKo2FYd6SPYDigRH/2uXxGA9XEzR3hTgIi+oppKpJCAu9jtG/mMdlz/84W5JtR
X-Received: by 2002:a05:6a20:2446:b0:366:2447:6778 with SMTP id adf61e73a8af0-398ecd6c849mr13870485637.53.1773718822408;
        Mon, 16 Mar 2026 20:40:22 -0700 (PDT)
Received: from ZC-202510311500 ([61.185.217.216])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82a07343719sm14847237b3a.38.2026.03.16.20.40.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Mar 2026 20:40:21 -0700 (PDT)
From: Haoyu Lu <hechushiguitu666@gmail.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Frank Li <Frank.Li@nxp.com>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
	linux-i3c@lists.infradead.org,
	imx@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	"haoyu.lu" <hechushiguitu666@gmail.com>
Subject: [PATCH] i3c: fix missing newline in dev_err messages
Date: Tue, 17 Mar 2026 11:40:15 +0800
Message-ID: <20260317034015.638-1-hechushiguitu666@gmail.com>
X-Mailer: git-send-email 2.53.0.windows.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260316_204023_720462_6F50E5F2 
X-CRM114-Status: UNSURE (   9.31  )
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

From: "haoyu.lu" <hechushiguitu666@gmail.com>

Add missing newline to dev_err messages in:
- drivers/i3c/master.c
- drivers/i3c/master/svc-i3c-master.c

Signed-off-by: haoyu.lu <hechushiguitu666@gmail.com>
---
 drivers/i3c/master.c                | 2 +-
 drivers/i3c/master/svc-i3c-master.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/i3c/master.c b/drivers/i3c/master.c
index 9e6be49bebb2..27e93fcf2eba 100644
--- a/drivers/i3c/master.c
+++ b/drivers/i3c/master.c
@@ -2396,7 +2396,7 @@ of_i3c_master_add_i2c_boardinfo(struct i3c_master_controller *master,
 	 * DEFSLVS command.
 	 */
 	if (boardinfo->base.flags & I2C_CLIENT_TEN) {
-		dev_err(dev, "I2C device with 10 bit address not supported.");
+		dev_err(dev, "I2C device with 10 bit address not supported.\n");
 		return -EOPNOTSUPP;
 	}
 
diff --git a/drivers/i3c/master/svc-i3c-master.c b/drivers/i3c/master/svc-i3c-master.c
index b84b324e4111..e09a6218bf34 100644
--- a/drivers/i3c/master/svc-i3c-master.c
+++ b/drivers/i3c/master/svc-i3c-master.c
@@ -1268,7 +1268,7 @@ static int svc_i3c_master_do_daa(struct i3c_master_controller *m)
 	/* Configure IBI auto-rules */
 	ret = svc_i3c_update_ibirules(master);
 	if (ret)
-		dev_err(master->dev, "Cannot handle such a list of devices");
+		dev_err(master->dev, "Cannot handle such a list of devices\n");
 
 rpm_out:
 	pm_runtime_put_autosuspend(master->dev);
-- 
2.53.0.windows.1


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
