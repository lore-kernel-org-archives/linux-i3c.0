Return-Path: <SRS0=LJxM=F2=lists.infradead.org=linux-i3c-bounces+linux-i3c=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 21952C433DB
	for <linux-i3c@archiver.kernel.org>; Tue, 22 Dec 2020 17:40:49 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B36C322D73
	for <linux-i3c@archiver.kernel.org>; Tue, 22 Dec 2020 17:40:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B36C322D73
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=U4RW2oh2TUrJzuyf71cPhSpTv5danw8gvR5QaGLE2U4=; b=e1a5ka7mMz8RC3soKEYVA/7ee9
	MeU9tQzdnmLGQZc/WNbRkEj0D4zj1ms4alc2QHdIIulnuIOxBNSFwUYNmNWX+056cS59tSwsEQwJI
	4EzRUGZpb9OXF4bjvlbRf+DImsXmpn1E+48JSXQ+W0QEZ5m1N6T5ORqFzHj9cVJKAUDysjG5vZA6c
	4y1FE0C/hIr9CH1efmpbC890IqiLSmv+EN34nCb6Jm+1aCSxVxugvcURYMsu/zRzp1ZXcn1mRWAHr
	bSgfz1DqcU4QBw7fOtn+YQJ3pVTYFPQNGp+aRMLzW6MuNmEJtHzz9JshtsjDE9fm0T0ALeClvkuqw
	d9kHYzWg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1krleR-0007zO-8L; Tue, 22 Dec 2020 17:40:47 +0000
Received: from mail-qk1-x72e.google.com ([2607:f8b0:4864:20::72e])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1krXtu-0000R3-S7
 for linux-i3c@lists.infradead.org; Tue, 22 Dec 2020 02:59:51 +0000
Received: by mail-qk1-x72e.google.com with SMTP id 19so10802718qkm.8
 for <linux-i3c@lists.infradead.org>; Mon, 21 Dec 2020 18:59:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=pVwzRkT9t+vCLbJimoRDlmlmCV0mO3Zs8Jqmvw/7+kg=;
 b=V8jLwdl3yBMgUkp36hPLWLMm65BnJDMsVlJN/lOEUnuaDYJ+UrkR5MKkLhTR26T+9l
 WxuLKOTSxfvD9sPQUfM9YYbJjc+AHXBWYoIX00ZG49bfgf2Agsk+K/7p2iz20asEXSdd
 loq4hCKoduEuKjndn0Jn/jyPiG784fLf+Vywr5QWmJcbD1POYywQTRbYj4dzUUzACdDX
 Qpd7eA9/sLOERHE/OnCCUNmY8tMoVmsxQNbJvxmvavM+ZKhM9vWrOFMSIgJOW26olznX
 hC3H66yzPOr2VCwbR3sYjA0meeXucCA7SQ1jFwX+OImHZchUM6ZmWlT54kitH3lOSgbA
 XMJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=pVwzRkT9t+vCLbJimoRDlmlmCV0mO3Zs8Jqmvw/7+kg=;
 b=b0ZmeIF6a4leyOM3MV2gYjSBf+RGjoRXkE1YzPpOEEMlkz4h4f+PI22S9U3ge3hoft
 J5b9Kx/QjhO/oYhALzxeMATC7RHcmTOlxMs6IVbo1UuVQVZPdsppPBzz7yz9CuMm2lnV
 lVNzvuo1aUju/4Y6nqXN0TOkE4DOhNgCdDHO+z4UVYKg0kpcbIkYWDHExWhNtWPuwe3g
 O0waA1d1gPorq7AipwG+LMsprusra4Au9xGU0ZP5yBrgqorY+iePdYIRoY1aQ45fTeTe
 VTVllMSoNkqyAlAnYj2oFvlctANBm9FJrlW+/81sjTGcDnCEqoBFQjwcJBauDFLrLlZi
 4/HQ==
X-Gm-Message-State: AOAM530DP73Hb2X2inLE8D39aUnI3ww3rIXewvBlqFz1rYWgjzLFIieL
 /zllIWYkQmpLHVexcMA7Bl4=
X-Google-Smtp-Source: ABdhPJzxpUX1DxDch3nTQKlRm2htJs79YIpaRQXm9tksW306M1+41tCMJtI5oENQAc/x5llZ0ByucQ==
X-Received: by 2002:a37:9f82:: with SMTP id
 i124mr20338981qke.264.1608605987162; 
 Mon, 21 Dec 2020 18:59:47 -0800 (PST)
Received: from localhost.localdomain ([2604:1380:45f1:1d00::1])
 by smtp.gmail.com with ESMTPSA id x47sm12104745qtb.86.2020.12.21.18.59.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Dec 2020 18:59:46 -0800 (PST)
From: Nathan Chancellor <natechancellor@gmail.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Subject: [PATCH] i3c/master/mipi-i3c-hci: Fix position of __maybe_unused in
 i3c_hci_of_match
Date: Mon, 21 Dec 2020 19:59:31 -0700
Message-Id: <20201222025931.3043480-1-natechancellor@gmail.com>
X-Mailer: git-send-email 2.30.0.rc1
MIME-Version: 1.0
X-Patchwork-Bot: notify
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201221_215950_924170_249A9802 
X-CRM114-Status: GOOD (  13.34  )
X-Mailman-Approved-At: Tue, 22 Dec 2020 12:40:46 -0500
X-BeenThere: linux-i3c@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-i3c.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-i3c>,
 <mailto:linux-i3c-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-i3c/>
List-Post: <mailto:linux-i3c@lists.infradead.org>
List-Help: <mailto:linux-i3c-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-i3c>,
 <mailto:linux-i3c-request@lists.infradead.org?subject=subscribe>
Cc: Nick Desaulniers <ndesaulniers@google.com>, linux-kernel@vger.kernel.org,
 Nicolas Pitre <npitre@baylibre.com>, clang-built-linux@googlegroups.com,
 Nathan Chancellor <natechancellor@gmail.com>, linux-i3c@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org

Clang warns:

 ../drivers/i3c/master/mipi-i3c-hci/core.c:780:21: warning: attribute
 declaration must precede definition [-Wignored-attributes]
 static const struct __maybe_unused of_device_id i3c_hci_of_match[] = {
                     ^
 ../include/linux/compiler_attributes.h:267:56: note: expanded from macro
 '__maybe_unused'
 #define __maybe_unused                  __attribute__((__unused__))
                                                        ^
 ../include/linux/mod_devicetable.h:262:8: note: previous definition is
 here
 struct of_device_id {
        ^
1 warning generated.

'struct of_device_id' should not be split, as it is a type. Move the
__maybe_unused attribute after the static and const qualifiers so that
there are no warnings about this variable, period.

Fixes: 95393f3e07ab ("i3c/master/mipi-i3c-hci: quiet maybe-unused variable warning")
Link: https://github.com/ClangBuiltLinux/linux/issues/1221
Signed-off-by: Nathan Chancellor <natechancellor@gmail.com>
---
 drivers/i3c/master/mipi-i3c-hci/core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/i3c/master/mipi-i3c-hci/core.c b/drivers/i3c/master/mipi-i3c-hci/core.c
index 500abd27fb22..1b73647cc3b1 100644
--- a/drivers/i3c/master/mipi-i3c-hci/core.c
+++ b/drivers/i3c/master/mipi-i3c-hci/core.c
@@ -777,7 +777,7 @@ static int i3c_hci_remove(struct platform_device *pdev)
 	return 0;
 }
 
-static const struct __maybe_unused of_device_id i3c_hci_of_match[] = {
+static const __maybe_unused struct of_device_id i3c_hci_of_match[] = {
 	{ .compatible = "mipi-i3c-hci", },
 	{},
 };

base-commit: 95393f3e07ab53855b91881692a4a5b52dcdc03c
-- 
2.30.0.rc1


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
