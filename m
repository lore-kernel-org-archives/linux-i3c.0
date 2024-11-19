Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DEB43D59D6B
	for <linux-i3c@archiver.kernel.org>; Mon, 25 Nov 2024 20:56:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=lnnz5/SBOBIx2EQ98xpPx7lppzdF1XOY71DXzfJdNHk=; b=MXFKWTYMk++Dqm
	+cpPIT7p56js1mali8IyRtYKECjrwtrEVnAGsPy+0URC2kMlA6SjOK0x8EqhKUJr6QXTeSTkv+y5q
	RnLOfMBsmkewlwdyiBaT+bhFlufpcAcPgYWqDlRlUEyh4vkwYgPDzMEc64nma9Qbkgs+Ot4+6td9p
	mRY31YIWC2Y82LKYY4ZUJfseP1NZaHInq2A43EYODYWHkCBsrNTSPGk06UZ2bG63CjMnK7p+pojik
	kXcDLcLN690DgGLgpgfS+jM9zS5gG7EgmmJXUALi9dxaG8jeggKOr+t5emzIbJwgAbfEt8RL8noZg
	DmVnldiF7X06rySZvhrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tFg8T-0000000959r-29EO;
	Mon, 25 Nov 2024 20:56:45 +0000
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tDQKV-0000000CtKI-1cny
	for linux-i3c@lists.infradead.org;
	Tue, 19 Nov 2024 15:39:52 +0000
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-20e6981ca77so48349835ad.2
        for <linux-i3c@lists.infradead.org>; Tue, 19 Nov 2024 07:39:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732030790; x=1732635590; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=7KzftO9zi2bxnpNJZHPjDGDIefT9OY4V7qnZzEYHPhk=;
        b=d1YEH3ASpDgF0sCTXlSeijfI+8jSH5XtoumHxQ6t4g8hdCLy6V6FDC2tqkVISVHsFn
         2sMUTwXfKkhf04o7kBjl5nOqQXwn+4lk0M94qCzA0ppD1IEelZhjHpthWOGvaZYne0M0
         5SisF15ZlHGe5Y+T5gqkK+96zxzUT9rmhgiPxDIqym6OyF28sV8DDbob85Q+q2bIo//7
         SDuU2rNATd/4mDmAZJr0M4KcMs4PWKcRyOb2bLEYkhnBHe9nK9dpjS+qb393Cu9fKmbs
         hmvc7shFsbA6RDTd8SCx8a+d2DBG7g9FzruuK3At4C63J4uSNGKHu/RjUt8TqXsv+GUr
         UVDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732030790; x=1732635590;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7KzftO9zi2bxnpNJZHPjDGDIefT9OY4V7qnZzEYHPhk=;
        b=MTBcT4CzLggUflWYK2oM/UwKqPagGNc6Cn+uXybwdRZoltYILfvr34/PscMfHIBaAz
         1KSBzxKlFJx8Nm9WW/r4OVlY2lfccyo7FMNhLPHvYviTdadvdHlpPHV19ecPb8ov46r5
         HUrNfeRXuvgJBJzBTeB4waeBhFWSoCJu8SoHlc2kKvm3vNQ/50TXsBHdwGENlQWb59zu
         fCbTqLdbSPOtq3U+0f+rFsQJ53/Dnp1ehpNZRnKTVXwUMRrAs+mkTOd69JY4rblJbvcy
         XPq+bys8oyTi4WOMTt320TG2KsdNXHdGjOK05w3LQhu8/NueBZs75GTQNwSNStkbqhpf
         wSqw==
X-Gm-Message-State: AOJu0Yy3vDxtMSIoLNcxA4x8zfkcfgLGpgCeuWSWiJN/oTEb22ANG3mC
	/ucln34HoHH7gsxPOsW3sVarw799v9hBZFR0TTv6x3FaZ9QRenud
X-Google-Smtp-Source: AGHT+IGVBPGQzY6hPrwtnFG1R1rj7oLhaWoxeEWonvMcUjG2rx218VxjPEKt3FCtBiTZe+sCPeCVyw==
X-Received: by 2002:a17:902:d482:b0:20c:7eaf:8945 with SMTP id d9443c01a7336-211d0d8fff5mr230230695ad.28.1732030789888;
        Tue, 19 Nov 2024 07:39:49 -0800 (PST)
Received: from advait-kdeneon.. ([2405:201:1e:f1d5:7dd3:c95:4ddf:3d69])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-212389529b6sm30114595ad.236.2024.11.19.07.39.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Nov 2024 07:39:49 -0800 (PST)
From: Advait Dhamorikar <advaitdhamorikar@gmail.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Advait Dhamorikar <advaitdhamorikar@gmail.com>
Subject: [PATCH-next] i3c: master: Fix potentially uninit variable
Date: Tue, 19 Nov 2024 21:09:41 +0530
Message-Id: <20241119153941.8307-1-advaitdhamorikar@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241119_073951_421603_08FC6F89 
X-CRM114-Status: UNSURE (   9.48  )
X-CRM114-Notice: Please train this message.
X-Mailman-Approved-At: Mon, 25 Nov 2024 12:56:44 -0800
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

devinfo is uninitialized if the condition is not satisfied,
add an else condition to prevent unexpected behaviour.

The variable will contain an arbitrary value left from earlier 
computations in `i3c_device_uevent`.

Signed-off-by: Advait Dhamorikar <advaitdhamorikar@gmail.com>
---
 drivers/i3c/master.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/i3c/master.c b/drivers/i3c/master.c
index 42310c9a00c2..7594d3793eb0 100644
--- a/drivers/i3c/master.c
+++ b/drivers/i3c/master.c
@@ -284,6 +284,8 @@ static int i3c_device_uevent(const struct device *dev, struct kobj_uevent_env *e
 
 	if (i3cdev->desc)
 		devinfo = i3cdev->desc->info;
+	else
+		return -ENODEV;
 	manuf = I3C_PID_MANUF_ID(devinfo.pid);
 	part = I3C_PID_PART_ID(devinfo.pid);
 	ext = I3C_PID_EXTRA_INFO(devinfo.pid);
-- 
2.34.1


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
