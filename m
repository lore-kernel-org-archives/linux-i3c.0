Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B113AC54EBE
	for <linux-i3c@archiver.kernel.org>; Sun,  8 Jan 2023 19:51:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	Mime-Version:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=Me1mzqfv+BZUrda1mOQhoFA9MMGqUwbtO2/xVZL48Ks=; b=KYB
	pVJ1ZaugXWw96jDGElgenj+rsz7+rmBV9YtHdojE83niW3pywMh9JRehxJUSXdEJl+C7Wmr0qtmQD
	+w7snkuqp8B9blWpPW3aLdncf4z5EjzUINShHTPhsQCubIJuFr95v7JwDGHySJb6aiPkLAXgg1T3k
	RZKmtZzDo1fDUeQxDVThWi/8AhKg4GACr9g7SeLdpIovQ8oDfb7NYWbeQHe3w3vsiuJO99i6YJyaI
	qdDvPPVaXu+hqZ9TSZ3JVQGn4LmN1rtZqmz328CWgDnF4OVa0QiYvCYszlIXPzfAAx35v/rp8QQvn
	h2SuY7wW9aq7SlptEJYTzG9IWjbeecw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pEbhD-00FWwX-OC; Sun, 08 Jan 2023 19:51:08 +0000
Received: from mail-yw1-x114a.google.com ([2607:f8b0:4864:20::114a])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pDXoH-00F7BD-Ng
	for linux-i3c@lists.infradead.org; Thu, 05 Jan 2023 21:30:03 +0000
Received: by mail-yw1-x114a.google.com with SMTP id 00721157ae682-45dd4fb5580so395613057b3.22
        for <linux-i3c@lists.infradead.org>; Thu, 05 Jan 2023 13:29:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=kg8e6X8QypwU6fo01tgR0TLXOAMliK1bqQELeacQNQs=;
        b=LBIxe1s13Tnk1/aAog7/AORZ2JPm3+K/T/1D2O4ZKNdhK3nXHbC08MLMVzrI79TU7J
         rr6ieT02Yx9S7cQJobVZccIPUQLZByWLYg2V+DFpxJpP+MVf36Vwz96P2UyTMz8Rb4qG
         ZXKimO7h0tQXwVS2SS2IQOlvk1pMNU5TVCQ+MMH4pu7Q/kdxeAyMBwUQHZJXcmetuI5S
         141mx6u4bbQUPh9U6c3K953Jgjbnu/xKafiBN5SqMp081jE1BY0adnXXyEOnonEOVqnF
         hiyzGqo0Y5mn8OhPmsMXpDo4KAtYkvpx0LuyAdJRDxniZNcPACFkrg4fylTu1Vfke/OX
         dVyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=kg8e6X8QypwU6fo01tgR0TLXOAMliK1bqQELeacQNQs=;
        b=ulMKXHvhQh8RHZT3akpme3RuL6AcuhXL63C60Xysex5Vfh4yDMlS/Z9oqRDPA4Emrn
         iLpIUaLiY1GC5jjT2SKekuPruhF0qYxRoY0E7aKA5sDyDrf16GmUkT11fFhmmJw6HfLE
         WJPNILTik8FSNCAKAQBrN6wKzOqJZ23yz2yXuGks1quZRNuUdLpDRZg0JKXr7g+TljNk
         hrmr7BxPHufD7qsmATe72lt9EeIca3yvqM10awNrcI4/ClF44Nbh7S8Uh44qX1FnOFY7
         ighRHfK50cVZls4VBKg4FfgiclT0QZbcE6BgXED8Ty+MHdpfCk3ydlV1MfApsto3KLL/
         7vTg==
X-Gm-Message-State: AFqh2kq3U8o7UytXecimeOTfQN4VLJssaXvNcnfXQPUCTjcFWLpUlehH
	QnkgngcauK1g1pEE0kTCiX3ewb3GcBHQcAI+
X-Google-Smtp-Source: AMrXdXsTxKR3Q2YRWauBZcRNoN6TbM+OJa2Nk05OHF5N/06n39nDMUGCHmbEbADUYlQOhyR0UjzMv4jVVmEtx34X
X-Received: from zenghuchen.c.googlers.com ([fda3:e722:ac3:cc00:2b:7d90:c0a8:2448])
 (user=zenghuchen job=sendgmr) by 2002:a81:1751:0:b0:4bd:caff:589e with SMTP
 id 78-20020a811751000000b004bdcaff589emr312806ywx.502.1672954197563; Thu, 05
 Jan 2023 13:29:57 -0800 (PST)
Date: Thu,  5 Jan 2023 16:29:52 -0500
Mime-Version: 1.0
X-Mailer: git-send-email 2.39.0.314.g84b9a713c41-goog
Message-ID: <20230105212952.56321-1-zenghuchen@google.com>
Subject: [PATCH] i3c: transfer pid from boardinfo to device info
From: Jack Chen <zenghuchen@google.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Jesus Sanchez-Palencia <jesussanp@google.com>, Mark Slevinsky <markslevinsky@google.com>, 
	Jack Chen <zenghuchen@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230105_133001_815313_39D59F2D 
X-CRM114-Status: GOOD (  11.07  )
X-Mailman-Approved-At: Sun, 08 Jan 2023 11:51:06 -0800
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

I3C device PID could be defined in device tree and stored in
i3c_dev_boardinfo. It should be passed to i3c_device_info when
allocating a i3c_dev_desc.
Rational behind this change is: when users decide to use SETDASA to
assign a dynamic address with exactly the original static address, in
step of i3c_master_reattach_i3c_dev, this address is checked to be
taken. Then device information retrieving step is skipped. As a result,
though the i3c device is registered correctly, its device driver could
not be probed.

Tested: Tested with a I3C device. If assigned-address is set to be the
device's static address, without this change, its device driver could
not probed. And with this change, its driver is probed successfully.

Signed-off-by: Jack Chen <zenghuchen@google.com>
---
 drivers/i3c/master.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/i3c/master.c b/drivers/i3c/master.c
index d7e6f6c99aea..4dad80338831 100644
--- a/drivers/i3c/master.c
+++ b/drivers/i3c/master.c
@@ -1438,6 +1438,7 @@ static int i3c_master_early_i3c_dev_add(struct i3c_master_controller *master,
 {
 	struct i3c_device_info info = {
 		.static_addr = boardinfo->static_addr,
+		.pid = boardinfo->pid,
 	};
 	struct i3c_dev_desc *i3cdev;
 	int ret;
-- 
2.39.0.314.g84b9a713c41-goog


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
