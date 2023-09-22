Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25F0BCD4847
	for <linux-i3c@archiver.kernel.org>; Fri, 22 Sep 2023 17:50:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=0G4yQ+8852d/yCFO9CrIGMOqkOUGxWXLIuf4iaCg5cQ=; b=QyGaf4/ohs9iqJ
	cQRCjOw80epRX6EuVyTAp0RE7xXO5S8Xi5Yg+Ztl8G6VM8FNtn3EefV02puMKWYul2PUQuOT5i0en
	hi9RxJIn7JA6Dmp4C+Tx7IYjqwJx796L3crUC+djfxiXa9ZPxQzYXRAh4ObjxyYg9bc5j5GuRq0Ga
	EsMSIU6/35Hyzxdf9O+htptLYp2TsPbKD+AZ3jUsd7sEV/uSfEQbrHX3NLa3aVAIr/h7Py+Luku6F
	p830jFnUFF8T+G9fI6+qX8uCrGDzhisgr/t/FfFPMwCl0+wQORXrgwPHVJb7VeFhwCwA0dAK0ribx
	H82LQekNq+X9B9KmnZpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qjkIE-009YEh-1l;
	Fri, 22 Sep 2023 17:50:18 +0000
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qjkIA-009YDf-1z
	for linux-i3c@lists.infradead.org;
	Fri, 22 Sep 2023 17:50:16 +0000
Received: by mail-pf1-x42b.google.com with SMTP id d2e1a72fcca58-690ce3c55f1so2035410b3a.0
        for <linux-i3c@lists.infradead.org>; Fri, 22 Sep 2023 10:50:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1695405013; x=1696009813; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=NHp1ED10bg43WmKmQvz+z20YRsbZCcJDatOaeiR4cRc=;
        b=lF+3EyjuHIPy3dbiXWIHQRpJ32YDtx0qQcu8NPuvPFu91diT6oizZRquM+XprXv+sq
         6mEBTGCVMPDqY3zBK7cyFPETKWzvYbIIYUNIMEz1FKKh7ZYNqwL17hOtJjkHhsHEqFf1
         qEyrl+qxv2mm5b5M8JyGNArrZm2QnzfSPBtzg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695405013; x=1696009813;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NHp1ED10bg43WmKmQvz+z20YRsbZCcJDatOaeiR4cRc=;
        b=UVEl62yTFP1vlnHrURCRI78/+Rc0oYu+yUdQGDbsPLBAj3YhmMUElqLCD1g8ZVkpjY
         VxKq0OhCUR7J7CW7gZ7oIoCwX9On0YMLQIVtbF9rZsC8acKUMn0VSDk3yqLiM9HsUvWS
         coASrDt7EVL1zUyjmgu98I4qWxaxqP0BpO8eSonjjYDZXG70lqYw4cKPTCSs+CTn70jD
         LpiybrUGAwO6QZ9YhPlNLV8pgSvwhsywCxqEnesNNK/mZiJPNvW+p5ASZcPbCGDqfzBl
         7CYBe7dmq9k9XLqJQEMQr7jiz9wipTn7FzqN7ZQR0AE1JmhOcapw85RHnQl06EHG6PBd
         xK/w==
X-Gm-Message-State: AOJu0YwT+LfTE0P5feDVSHC3MmFqveuEpxK4Y9SkvS3qIZJAZLi57j4C
	QSQoZwuoibqi/0XUoGfrQFW+Rg==
X-Google-Smtp-Source: AGHT+IFUQBKrktGM7T6XnCIgINsyQ4Uqfg3+fboOe93XpLQmHZ2pILAVIbZVXa2loO83xONkmkZlfA==
X-Received: by 2002:a05:6a20:430b:b0:153:b16e:8db1 with SMTP id h11-20020a056a20430b00b00153b16e8db1mr245441pzk.10.1695405013229;
        Fri, 22 Sep 2023 10:50:13 -0700 (PDT)
Received: from www.outflux.net (198-0-35-241-static.hfc.comcastbusiness.net. [198.0.35.241])
        by smtp.gmail.com with ESMTPSA id 21-20020a170902c11500b001b9d7c8f44dsm3767571pli.182.2023.09.22.10.50.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Sep 2023 10:50:12 -0700 (PDT)
From: Kees Cook <keescook@chromium.org>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Kees Cook <keescook@chromium.org>,
	Jeremy Kerr <jk@codeconstruct.com.au>,
	Joel Stanley <joel@jms.id.au>,
	linux-i3c@lists.infradead.org,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Tom Rix <trix@redhat.com>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
	Matt Johnston <matt@codeconstruct.com.au>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Jack Chen <zenghuchen@google.com>,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev,
	linux-hardening@vger.kernel.org
Subject: [PATCH] i3c: dw: Annotate struct dw_i3c_xfer with __counted_by
Date: Fri, 22 Sep 2023 10:50:11 -0700
Message-Id: <20230922175011.work.800-kees@kernel.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1240; i=keescook@chromium.org;
 h=from:subject:message-id; bh=g1g4deThn2jq2/HmpjUdVckXHtYrg1phRYVjxqpT31c=;
 b=owEBbQKS/ZANAwAKAYly9N/cbcAmAcsmYgBlDdPT88H9qzG3LMBy5A38JWSSkUyL3Eg6YJLhU
 eMX5HXSGtKJAjMEAAEKAB0WIQSlw/aPIp3WD3I+bhOJcvTf3G3AJgUCZQ3T0wAKCRCJcvTf3G3A
 JpPwEACXZRomIRPU03APpI2pgvFryCHHAmuDLTXo0N1fOecwRoE4OGPaNSqxHZPbQchIrRD5yF2
 2dtE1vedKPQ36FCNd1BwbsjXBmiJ3TNdl6bYV8cBK15uCpVDhwWgGbYXEOb0ZFC3W+Id4Y4vUBT
 rP7TxnKo2Y/NRYdKNeFRo+0kGxIW3o2B9flG2MIwDroKvUztJPHPJ+w/XDm3fUA7mJlAeQ/Ft1n
 pfiE4aFzxeUBy75Y1n/Kb1+CIFw8hFjmV4PmfTlUbdsYL2HNl9kX5b/+ULhPiEr2yr/namr9ckn
 Bv6v30Wc10cBSr/YO4ueLcr/RYKLZqJqmx8w1numFHJkhRIbk9d2D+A5Qxx3i+/LO+A25t45cIr
 CazDqhoKDhq66/KtUesFjWOpwuIP0maUx/BcoKvTDVziUbNKlM9XVEsUg1RCR25GOTAIPyYqKRK
 tERqOZjC1PEzFwxPvIlX81QQVkxPEnwgux++N4hNgXMqK3uGDPrmP65kpeVLv55kh0QB6lOOloU
 1CihM9VKHEPWBy2KM8zJVbTbyn5PlQQ8D7c7wcTO4ocA5q1cqWTf/R0bH8YIO0lCX6AuhnUcLCT
 5MEnctf90+Y4LvEimrbWP8c+2OJp4TPkHzH/bwt5+YoxFvuJoCQMkQxvnE1mGXVGjWiNwc4gBC8
 c1GN5F1 dRrNbxxQ==
X-Developer-Key: i=keescook@chromium.org; a=openpgp; fpr=A5C3F68F229DD60F723E6E138972F4DFDC6DC026
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230922_105014_657307_D36508E9 
X-CRM114-Status: GOOD (  11.03  )
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

Prepare for the coming implementation by GCC and Clang of the __counted_by
attribute. Flexible array members annotated with __counted_by can have
their accesses bounds-checked at run-time checking via CONFIG_UBSAN_BOUNDS
(for array indexing) and CONFIG_FORTIFY_SOURCE (for strcpy/memcpy-family
functions).

As found with Coccinelle[1], add __counted_by for struct dw_i3c_xfer.

[1] https://github.com/kees/kernel-tools/blob/trunk/coccinelle/examples/counted_by.cocci

Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Jeremy Kerr <jk@codeconstruct.com.au>
Cc: Joel Stanley <joel@jms.id.au>
Cc: linux-i3c@lists.infradead.org
Signed-off-by: Kees Cook <keescook@chromium.org>
---
 drivers/i3c/master/dw-i3c-master.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/i3c/master/dw-i3c-master.c b/drivers/i3c/master/dw-i3c-master.c
index 9332ae5f6419..ef5751e91cc9 100644
--- a/drivers/i3c/master/dw-i3c-master.c
+++ b/drivers/i3c/master/dw-i3c-master.c
@@ -233,7 +233,7 @@ struct dw_i3c_xfer {
 	struct completion comp;
 	int ret;
 	unsigned int ncmds;
-	struct dw_i3c_cmd cmds[];
+	struct dw_i3c_cmd cmds[] __counted_by(ncmds);
 };
 
 struct dw_i3c_i2c_dev_data {
-- 
2.34.1


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
