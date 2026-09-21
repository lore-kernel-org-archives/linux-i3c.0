Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D03EC982E6
	for <linux-i3c@archiver.kernel.org>; Mon, 21 Sep 2026 23:07:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=ZFTz3/H/BbBSIQYr9LxykfiSrsVrYxO6tQ1K467KNQw=; b=MG2GP3HsAavyxBjkKZMi1oDul7
	j+PdqPi+UwtnwYH33FJZUBss8SuffXHA3cEudW8yMEOIJplErebeSnKgaa5pADsNukn8dUUxX18NL
	ooh9b56XKMLgKOKRduaCsfJDIwrtubnL1rT499+/ZTVFis+7/kP5hwixOmxmVhJZ45svgUCaws/fw
	soa0/NTY99ChQzLNrHBNy+tGv9tIEyfpdItnldt2b0ZCjTvGuDGU42SIRgwIkXFp+j6hyZB/M2ZKC
	gluDCOONsF9Tvcl8khfgmdPeitBb9to+HD1haUjuBdEv8mEPmGbo+qHaz0voRZhVqY+s8+S2pYH7C
	66qLBekA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8n6b-00000003dVu-1Hmx;
	Mon, 21 Sep 2026 23:07:25 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8n6a-00000003dV8-0qFU
	for linux-i3c@bombadil.infradead.org;
	Mon, 21 Sep 2026 23:07:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Cc:To:From:Subject:
	Message-ID:References:Mime-Version:In-Reply-To:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=rN3UiEVeD5JTvm5L/WrJ3sMgipX1w5Id3f3Ngl73Mok=; b=ehycry9cvPxmWxT76goJPB6jsg
	JMRbxkNn02qc0iz0sA56kRPLdl3W6lCbFDAaGaIcZ45AD5jov3SHIiRbCl6hfGPMNsfEO9c8CP2iV
	BFh9pWavBgRalmx9psh1ADT8/Kj7bE4MmvsKVrfNUkHs/YiFZ/vbQv9ngtvMOz/k5SGsbhfhyU4kI
	FdPZDhkXxCIgsEIviBr8DMDCxMDPi6AYqB6qeZycukysNd/A5DkKB3dbGDY/9jVA4cqjFC3Uk+62X
	qp3A5+M6OLMZLES9uXhzfg6uq/Hui3PnN4ON6eRj6EWiAYzVWFW8+Qcq1lyAJLCcFiMUsQn1OBIJR
	jcCl7pRg==;
Received: from mail-pg1-x547.google.com ([2607:f8b0:4864:20::547])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x8n6P-0000000Cu2B-0omS
	for linux-i3c@lists.infradead.org;
	Mon, 21 Sep 2026 23:07:22 +0000
Received: by mail-pg1-x547.google.com with SMTP id 41be03b00d2f7-cc1cdfb337eso4927271a12.0
        for <linux-i3c@lists.infradead.org>; Mon, 21 Sep 2026 16:07:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790032030; x=1790636830; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rN3UiEVeD5JTvm5L/WrJ3sMgipX1w5Id3f3Ngl73Mok=;
        b=CoGWRYzgfEbKeChNy1atZTmFZbDd0u/2tlpnjBCVopjq2OSCkRditE0FfadcJwgsNl
         pii9wUwB1TvvmFVZtET2SObbC7lO75t8FdBh0L7ACnUuOjxDgUX++zwpRvORE2W76+VC
         aFd5iyVFpGfRXpRtkrbSONilzrgr70P6Ez5FePiFzrZwRVEUm0v1JzxQcNUbYSODlS1v
         AA//+ID47+tBR0MwEaKxhBA8Zd7Q5OiRjsHOf52vJYpOzl3uv+O24wXEpQcmGygpMyMo
         jlgEk6Q/DXvhMXKj2cHLSYuzGx7yLZKLg4a1pCv4AXE8Zbjc1R3sXCPTp8QuV6ib46Kb
         ScNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790032030; x=1790636830;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rN3UiEVeD5JTvm5L/WrJ3sMgipX1w5Id3f3Ngl73Mok=;
        b=jgHtfXkWVhDMWX9teCjwlDrngEw1spqvVBcAv5FuQs5kLWHl8fK2zwXSTe5Gu5jjNo
         MK7HzLlQ3rj6U/lABwdaQMOmDgcFbKbEY0wVxz9cy5Oe1g91Jlxaj+klC7S7aTkUubcB
         XoUCdJcHdOyPLOf2ra/Nu2O1X2rmv+lduoy+xGoSXUVQUS36HLNEB/y8RelPEeyteBIS
         vtIpWBoiQ2AvsCGLqAOlNdMC1A7oV+sP0Ob2gTXufKXfobni0mtBudmq9EqySCspZZZK
         pzzpGSwUxSeGF/AM21EQfZpN1iTiKOqSSwmcOLuNRCnSzD7N35dPVKVnRi42JlW7EYP2
         kmLw==
X-Gm-Message-State: AFuF++nmjmblWw29A731+A1oCLE/OnAG0w2d2da1xEotfKh/AwV8sGKi
	kJ6KdphpadQuTwc4+MxzA74YsnlNgbrX9n29ycCEH61fGH/4lkVbB9XuuCe0yYjbScZt2hZQunF
	7YGopBCfhsImpDXOMzEDDzTGJc2IteAGXNJL0+xLjRi3kJ20pHaffej1KxALSfqNDeFPb7EXrYC
	S4VwfOB2A+BoDRmqOfbhH3T1B4X1V6OYANTUomrSypGLF/kaNCsLKfxwvAO1+B0iXDltdfP+1DM
	Ek6JQ==
X-Received: from dleb16-n2.prod.google.com ([2002:a05:701b:4250:20b0:144:dc13:586b])
 (user=samagazaryan job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a21:7704:b0:3cc:ec12:a788 with SMTP id adf61e73a8af0-3dd8c3f1681mr17721014637.4.1790032029435;
 Mon, 21 Sep 2026 16:07:09 -0700 (PDT)
Date: Mon, 21 Sep 2026 23:06:00 +0000
In-Reply-To: <20260921230603.2518652-1-samagazaryan@google.com>
Mime-Version: 1.0
References: <20260921230603.2518652-1-samagazaryan@google.com>
X-Mailer: git-send-email 2.55.0.1082.g2b9226bbc0-goog
Message-ID: <20260921230603.2518652-3-samagazaryan@google.com>
Subject: [PATCH v5 2/5] i3c: master: add i3c_for_each_dev helper
From: Sam Agazaryan <samagazaryan@google.com>
To: linux-i3c@lists.infradead.org, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Frank Li <Frank.Li@nxp.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Wolfram Sang <wsa+renesas@sang-engineering.com>, Arnd Bergmann <arnd@arndb.de>, 
	Adrian Hunter <adrian.hunter@intel.com>, Meagan Lloyd <meaganlloyd@linux.microsoft.com>, 
	Vitor Soares <vitor.soares@toradex.com>, 
	Oleksandr Shulzhenko <oleksandr.shulzhenko.viktorovych@intel.com>, 
	Boris Brezillon <boris.brezillon@collabora.com>, linux-kernel@vger.kernel.org, 
	Sam Agazaryan <samagazaryan@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260922_000719_732506_0532C9D7 
X-CRM114-Status: UNSURE (   8.95  )
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

From: Vitor Soares <vitor.soares@toradex.com>

Introduce i3c_for_each_dev(), an i3c device iterator for use by i3cdev.

Signed-off-by: Vitor Soares <vitor.soares@toradex.com>
Signed-off-by: Sam Agazaryan <samagazaryan@google.com>
---
 drivers/i3c/internals.h | 2 ++
 drivers/i3c/master.c    | 6 ++++++
 2 files changed, 8 insertions(+)

diff --git a/drivers/i3c/internals.h b/drivers/i3c/internals.h
index cbc00c862104..3c53a5108b81 100644
--- a/drivers/i3c/internals.h
+++ b/drivers/i3c/internals.h
@@ -79,4 +79,6 @@ static inline struct i3c_master_controller *i3c_bus_to_i3c_master(struct i3c_bus
 	return container_of(i3cbus, struct i3c_master_controller, bus);
 }
 
+int i3c_for_each_dev(void *data, int (*fn)(struct device *, void *));
+
 #endif /* I3C_INTERNAL_H */
diff --git a/drivers/i3c/master.c b/drivers/i3c/master.c
index e8a9f8c3041e..07540ea73aec 100644
--- a/drivers/i3c/master.c
+++ b/drivers/i3c/master.c
@@ -4011,6 +4011,12 @@ void i3c_dev_free_ibi_locked(struct i3c_dev_desc *dev)
 }
 EXPORT_SYMBOL_GPL(i3c_dev_free_ibi_locked);
 
+int i3c_for_each_dev(void *data, int (*fn)(struct device *, void *))
+{
+	return bus_for_each_dev(&i3c_bus_type, NULL, data, fn);
+}
+EXPORT_SYMBOL_GPL(i3c_for_each_dev);
+
 static int __init i3c_init(void)
 {
 	int res;
-- 
2.55.0.1082.g2b9226bbc0-goog


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
