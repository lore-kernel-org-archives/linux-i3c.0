Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C53D7E88D66
	for <linux-i3c@archiver.kernel.org>; Sat,  4 Apr 2026 10:32:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ZpdcVyZY6TlaAfEcg+4F12iswSmjKTKS1f80Dwi2KI8=; b=VnpFqAzFtDLEUH
	eWrjvgyg3VjPrUeUIL/BLFvVKTYtDnaHHD4HuSFmN3E1O/oY/myE2a/qfT1U7y/yLvll1MXkb+pq6
	YfDhew5Ag3bPDXkw1F5j3gF9XALqk9cFRQSWlIHrORTtoscmjzKG1b7wVapfR44J3l2EMOhdTwQ/H
	8XAmJFsxRV3SWFoWKtD656L/eLy68/VIe0L7E5qyFb1jSUQDU3XZZgjx2EavVGlu9MLxLR3RzxxJv
	IcEYi3ij0eRyAywNVkshbeT/qR1N0x9IiQOEes0zQNd+7ymubt9dc82D66T87X1XujjGo55JjTOIp
	X3Ul+rcIsYmynrNSvKrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8yJH-00000003Nu4-1I0m;
	Sat, 04 Apr 2026 10:32:59 +0000
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8yJE-00000003NtS-3Epx
	for linux-i3c@lists.infradead.org;
	Sat, 04 Apr 2026 10:32:58 +0000
Received: by mail-pf1-x432.google.com with SMTP id d2e1a72fcca58-82ce49785a0so1117540b3a.2
        for <linux-i3c@lists.infradead.org>; Sat, 04 Apr 2026 03:32:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775298775; x=1775903575; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=KuulWYX46kMU+HsWXol+iSxeRr4jFO4h7JDESur4MF8=;
        b=PJI74QImLUbJ8CZRtkr0hj97pzvGx1z+cB18g1HqAMy+RHMIXAqjkcgdFWfpzMV1Dl
         xH8nhOA/4D7fKbObDK1VBeX5miybmaqaEsoomIFwBcZYX12NP11fQ/bRZ2xBUFmq0pe0
         CPevugoxP2qxqlAVOJRLwTk1pbm3w0jJwady4Ysoootv9kn2Ko1DKVqQ4FChAgMcYDrU
         XJz8/BdkvsPyeY9OHJg6NXS4umw0WAaTQK1lllUmOx4e1/yQqBfrzXjHvlqYQRd7z0bq
         D/GKQPYQLoAnoAX16Qi9tTXIsTVQ5vgrAJFL8qJjsJ8xetenzhcr0KTsQHHwq27KYVrS
         FiGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775298775; x=1775903575;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KuulWYX46kMU+HsWXol+iSxeRr4jFO4h7JDESur4MF8=;
        b=mWNv3vK+ictEQW30ELcBJVt2dIgzh3/y2yekpcF/3EuwqXH1xRu863q4I36uRysJpE
         evkE/vdHy8uoXhvMOLaM9yrgCJAUT3/dS+Yv9vwto1HPj3sLwqPnI5UF4hF8w8GctPfK
         BlsL6RsmEALvsD2MZ7WLD2/+4VbZvgv2JFkdLV2a22bDmxDDHgsyCMqmA9xV5V+Pi84X
         A1afNS6EkNwXGnPYUqpadr8H1CpFrz4GevlziQg7PqGE8AXhPfSL7qO1pvIh6hpqcA89
         9Hsmjkrc1qWxpIVu+PrF9dbJ5g3BZxRm0xNCrYSXkwpdTGIf11HtZQ/Kabr094rQn637
         Oxxw==
X-Gm-Message-State: AOJu0YxrEJP34d8IfXPOK4CVhJH4f1EzaUlKPHdBaAd6VZGye/NPKGCU
	CKRqq5tidlFFYDMjV7iYaP3hROIS1YSSCvHaz7uwpomG9kEZzwgLSuTI
X-Gm-Gg: AeBDietvuUjFyOmPgy9bEPZl+aIQjEjGSn5Zfequ5Ajc0C2S3wUJGJ0ZKuL/+WO5Kbf
	NB6k4wwrX8K7oUj8Vt3yWeuUx9IKjQU9HqUtgU9wlWrwsO+K6Fg0fv4GM9zxtOV8RuI74FtASt1
	O+slySLB7NC6AIwwrCmNAfiEPId/E9NGJ5IO5ukfutKmBNJbF2gCucklQkXetzQbZ+/eYLOYLr/
	MTrqVhncfJUOuM3+dGo3R5Fr01XdIa1V+QklRLHka48c1d7YoOFAc3lF+umwBmv8E60Ba8JKODv
	h8m09u4taD6iSXaTqqmsG18m2Rw9kwlUTuB3MiXSAxy71AolLhQMP1fiomRouOqBwgMPMM0ErPS
	i86HxOluVdhjIidkuRAQawQL7E5hoy/LIDkmd8jegV06QnsS/Dx7S9fG6xXNPyPoZYpDKcyXrDS
	3qKjRaPd/5B3pJKGFgZZckgHj4ec2rJJb09DTG
X-Received: by 2002:a05:6a00:23d5:b0:827:2ed6:888f with SMTP id d2e1a72fcca58-82d0dbe526emr5953416b3a.54.1775298775048;
        Sat, 04 Apr 2026 03:32:55 -0700 (PDT)
Received: from junjungu-PC.localdomain ([223.167.147.240])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82cf9b27064sm10475789b3a.9.2026.04.04.03.32.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Apr 2026 03:32:54 -0700 (PDT)
From: Felix Gu <ustc.gu@gmail.com>
Subject: [PATCH v3 0/2] i3c: dw: Fix memory leak in
 dw_i3c_master_i3c_xfers()
Date: Sat, 04 Apr 2026 18:32:29 +0800
Message-Id: <20260404-dw-i3c-2-v3-0-8f7d146549c1@gmail.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAL3o0GkC/3WMQQ6CMBBFr2JmbU07BaSuvIdxUdoBJhEwrakaw
 t0trFzo8v3892aIFJginHYzBEoceRoz6P0OXG/HjgT7zIASK1lIFP4pWDuBom4Vak+tMQ1Cvt8
 DtfzaUpdr5p7jYwrvrZzUuv6IJCWUaEotzVFWZUHu3A2Wbwc3DbBGEv4TMYvWVq5WXhv09ltcl
 uUDU5KMDNkAAAA=
X-Change-ID: 20260402-dw-i3c-2-8f123def99b2
To: Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Frank Li <Frank.Li@nxp.com>, Aniket <aniketmaurya@google.com>
Cc: linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Felix Gu <ustc.gu@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1775298773; l=832;
 i=ustc.gu@gmail.com; h=from:subject:message-id;
 bh=x9Q1Dytg1jpgcMbrK9wyOjYFHtU2jrei+y4w29mksxQ=;
 b=pq07I8tYGpZ4QcIeSD22jf4wVFOqYrI22x8FtryDENscUB9aCwGvb+Q8Dl2H7qDP6/7chB5JP
 4zERcYsb1peCLkdjqdKv+TPW81rRiuzfb0NeVO7A1RVUTsdi517uyu5
X-Developer-Key: i=ustc.gu@gmail.com; a=ed25519;
 pk=fjUXwmjchVN7Ja6KGP55IXOzFeCl9edaHoQIEUA+/hw=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260404_033256_817229_A0D0E0E8 
X-CRM114-Status: UNSURE (   6.37  )
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

Signed-off-by: Felix Gu <ustc.gu@gmail.com>
---
Changes in v3:
- Refine the commit message.
- Simplify the xfer cleanup using __free(kfree).
- Link to v2: https://lore.kernel.org/r/20260402-dw-i3c-2-v2-1-aa6c81d392da@gmail.com

Changes in v2:
- Switch to use __free(kfree) to automatically free the memory.
- Link to v1: https://lore.kernel.org/r/20260402-dw-i3c-2-v1-1-b530970654ec@gmail.com

---
Felix Gu (2):
      i3c: dw: Fix memory leak in dw_i3c_master_i3c_xfers()
      i3c: dw: Simplify xfer cleanup with __free(kfree)

 drivers/i3c/master/dw-i3c-master.c | 38 +++++++++-----------------------------
 1 file changed, 9 insertions(+), 29 deletions(-)
---
base-commit: bd0f139e5fc11182777b81cefc3893ea508544ec
change-id: 20260402-dw-i3c-2-8f123def99b2

Best regards,
-- 
Felix Gu <ustc.gu@gmail.com>


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
