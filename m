Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33041CD495F
	for <linux-i3c@archiver.kernel.org>; Thu, 21 Sep 2023 06:58:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	Mime-Version:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=9torUTOV/8CnHLONGSRNCopXfvTGihw7sChzHulJ6Tc=; b=pA1
	s+SRAAgktQOFnuTxWC/+OV/PuRlu7AqMciV1Zb5W1HlDHPMz+2vWLTdNavUBSkSjtjWGFtfYKCRWY
	G5p3M+LdalgsSS6ASeTP+6tAb1LzOWOF7fKV17vhRsGRHGzp/70wv/7aSUkzpwThRADNTekHEVBIx
	4Nj00nQ3FfIFG9vnkOh2r8XYDONkDt++wvBbOWtk5jHRC2/aFTEKdlyoCDxM82jXjV//oBHUajWTq
	YY+C+pnlBevl5PeNrRKYLt+9n/+x1SRUqBvG5GX6Mxsghe6t3gc917HWdq0blMcGm7w+X4zb6Bpuz
	fvfabAARoeHK+Lxl/nxAE3FssxCQZ2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qjDe5-005KTN-2C;
	Thu, 21 Sep 2023 06:58:41 +0000
Received: from mail-yw1-x1149.google.com ([2607:f8b0:4864:20::1149])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qjAia-004xoL-38
	for linux-i3c@lists.infradead.org;
	Thu, 21 Sep 2023 03:51:10 +0000
Received: by mail-yw1-x1149.google.com with SMTP id 00721157ae682-59e758d6236so7685487b3.1
        for <linux-i3c@lists.infradead.org>; Wed, 20 Sep 2023 20:51:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1695268265; x=1695873065; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=mEI/FE0LzaOE8LB3j/EPmAsW/lNDHZXMlP+MK6JtiH0=;
        b=NuDJNElkSKC9a00apAG+bRDbQyyDZRntjTsqr0Ze5PVGyzcpJpXF7gx//yaL5jEre8
         5bHb9l4i0rgGyHbE36gpe//oi9fcq3/i9gKcIaiZ+7iPoG/RAA1femyXYbbl+zfL60z4
         jNSAQc9cu+rsR3w2KXeCch6A8LTAKV5GysWInEKtJ9NX7crK1gxhk7pFAQyeiwuCpnd0
         VBXWbHSOpJ9troeGXGJbe5zWfKnEZ2ssdALLJi9sM/7OeCDV1llwHdCMWXMm+/kAkJ30
         QAqhjYmzDfa2BMTjoZGANcbPprgQMd2zjeQHMa9RFAhOOu1DgIwnt8AhqU7BgM/lVKOO
         HT5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695268265; x=1695873065;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=mEI/FE0LzaOE8LB3j/EPmAsW/lNDHZXMlP+MK6JtiH0=;
        b=Na7HLsmzGmcSF7Ggt0UF/Rkfjhpr9jY6vpjnPg4GtJ8KHacHSSDHSNgy3s9af6nMdr
         qLqWnxXLbxEM2vgsIKdYoyP+WImGlkjUxAwcY2R8AK9DFMzlR6uwM+JcP8AJCWN/lreC
         5OlGMxoOA2qb74LhHnVu7bRwLFm7X4NFkmQF6VHHE6AFOu3JluGXwSWXj2DDp0Bfd7g1
         IJ3M58e1Kt51OVC7YcaFfBZc7/DCibXGXx7sQFjvor9Y5ltOHGBaSDSjZBZBhl/1GgUZ
         M+9t72KdEG1o/V17gQDdYTZAusG/JnlkSoHq1JsWbFhCGPFcj2709wXupAvtd2IHDFk1
         kelw==
X-Gm-Message-State: AOJu0Yy+O52VsapdcWrqQf5BiPuIZnvMYbBxi4GqrYZWcxrM750ocwwn
	5/QD0WU51zUVQP2VG7w1FP8nbcQ7ms3UGQz6Gg==
X-Google-Smtp-Source: AGHT+IEYzveRK4DpKaBvTcozNvLOzlrpzzHF+TShyi7tBIAI7apmqP3Y8DUHUTwq86i/Sw1IZExa+IRloVCK7eDaOg==
X-Received: from jstitt-linux1.c.googlers.com ([fda3:e722:ac3:cc00:2b:ff92:c0a8:23b5])
 (user=justinstitt job=sendgmr) by 2002:a25:848e:0:b0:d82:9342:8627 with SMTP
 id v14-20020a25848e000000b00d8293428627mr63851ybk.6.1695268265522; Wed, 20
 Sep 2023 20:51:05 -0700 (PDT)
Date: Thu, 21 Sep 2023 03:51:04 +0000
Mime-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAKe9C2UC/x3MwQqDMAwA0F+RnA3Yyg7dr4iHkGYzB7uSFNkQ/
 33F47u8E1xMxeE5nGByqOundIRxAN6ovAU1d0Oc4jylGNCbFa4/zKaHmKPOjDt5E0PGnCQ8IqV ATNCLavLS790v63X9AcxwdSxuAAAA
X-Developer-Key: i=justinstitt@google.com; a=ed25519; pk=tC3hNkJQTpNX/gLKxTNQKDmiQl6QjBNCGKJINqAdJsE=
X-Developer-Signature: v=1; a=ed25519-sha256; t=1695268264; l=2236;
 i=justinstitt@google.com; s=20230717; h=from:subject:message-id;
 bh=xRRL8ZZagoPuEYpnmLvMHfqr3+/4b42z9ovF8TORhlE=; b=pVohjE+m58JPvLT2c72pPRI1bHXV2c7QOlM9qXaA2xrrnFGjQsCWYX+d7O882U2GpU1hdFZVW
 yLLUEfbE8+rDkX3sbp6f/QeKPamXfHchETunk7iwfC0o7f3mbtu7FJs
X-Mailer: b4 0.12.3
Message-ID: <20230921-strncpy-drivers-i3c-master-c-v1-1-9fdb8d8169e1@google.com>
Subject: [PATCH] i3c: replace deprecated strncpy
From: Justin Stitt <justinstitt@google.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-hardening@vger.kernel.org, Justin Stitt <justinstitt@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230920_205109_034742_63AD0FF5 
X-CRM114-Status: GOOD (  11.63  )
X-Mailman-Approved-At: Wed, 20 Sep 2023 23:58:40 -0700
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

`strncpy` is deprecated for use on NUL-terminated destination strings [1].

We should prefer more robust and less ambiguous string interfaces.

We expect adap->name to be NUL-terminated based on i2c_adapter name use:
| dev_dbg(&adap->dev, "adapter [%s] registered\n", adap->name);

NUL-padding does not seem to be required as `master` is zero-allocated
and `i3c_master_to_i2c_adapter` simply returns a field from within
`master`:
|       master = devm_kzalloc(dev, sizeof(*master), GFP_KERNEL);
...
|      	struct i2c_adapter *adap = i3c_master_to_i2c_adapter(master);
...
|       static struct i2c_adapter *
|       i3c_master_to_i2c_adapter(struct i3c_master_controller *master)
|       {
|       	return &master->i2c;
|       }

This means that `adap->name` should already be filled with NUL-bytes.

Considering the above, a suitable replacement is `strscpy` [2] due to
the fact that it guarantees NUL-termination on the destination buffer
without unnecessarily NUL-padding.

Link: https://www.kernel.org/doc/html/latest/process/deprecated.html#strncpy-on-nul-terminated-strings [1]
Link: https://manpages.debian.org/testing/linux-manual-4.8/strscpy.9.en.html [2]
Link: https://github.com/KSPP/linux/issues/90
Cc: linux-hardening@vger.kernel.org
Signed-off-by: Justin Stitt <justinstitt@google.com>
---
 drivers/i3c/master.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/i3c/master.c b/drivers/i3c/master.c
index 87283e4a4607..8573ca507708 100644
--- a/drivers/i3c/master.c
+++ b/drivers/i3c/master.c
@@ -2309,7 +2309,7 @@ static int i3c_master_i2c_adapter_init(struct i3c_master_controller *master)
 	adap->dev.parent = master->dev.parent;
 	adap->owner = master->dev.parent->driver->owner;
 	adap->algo = &i3c_master_i2c_algo;
-	strncpy(adap->name, dev_name(master->dev.parent), sizeof(adap->name));
+	strscpy(adap->name, dev_name(master->dev.parent), sizeof(adap->name));
 
 	/* FIXME: Should we allow i3c masters to override these values? */
 	adap->timeout = 1000;

---
base-commit: 2cf0f715623872823a72e451243bbf555d10d032
change-id: 20230921-strncpy-drivers-i3c-master-c-d9e152a91aca

Best regards,
--
Justin Stitt <justinstitt@google.com>


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
