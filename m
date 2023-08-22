Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3DFAEE49A5
	for <linux-i3c@archiver.kernel.org>; Tue, 22 Aug 2023 05:12:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	Mime-Version:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=mCqPIIR9qdiAjpZGdH4sUEvA7SDR/Wc6faC373VcJdM=; b=4PD
	63m5fA75/Thjr8EgrYn496sLyW4HowxDVRBegz6yvHO5CEanvBa9uhJ4qaSFfbHD9ChCyA6TuTXBr
	+CjJStIJh+L0/SF56irFDJpe4PrK9/qQm3WtvzGpGmAu2nqLD4O4eI9GkbphmJjF1lxBWmesrHQ/k
	gF+SOzf0+xWTB9zeR670wuscN8Bo9QyDtJJh+d+XpCbGlp5hRui2o5gTVmIxQS2OaJCbIMijMahlR
	ktssblMCnLJSIwYboU/sjP8MrLyvfOpZavNqEfzfs118mVgyoVxAjY7PqvXoLW9CtJmotxMqBBLmI
	Imb+qqnl4nzI5h7c8eaLhobEEzgHOUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qYJgn-00F8HX-33;
	Tue, 22 Aug 2023 05:12:25 +0000
Received: from mail-yb1-xb49.google.com ([2607:f8b0:4864:20::b49])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qYJgk-00F8GL-0s
	for linux-i3c@lists.infradead.org;
	Tue, 22 Aug 2023 05:12:23 +0000
Received: by mail-yb1-xb49.google.com with SMTP id 3f1490d57ef6-d7231c761b6so5081872276.1
        for <linux-i3c@lists.infradead.org>; Mon, 21 Aug 2023 22:12:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1692681136; x=1693285936;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=y49tMxZ0YY48F/gzN+18jldmFoxIYYQIj22aWek7pLI=;
        b=1E/HKtR80/j8Afv68qazxtHwIdlC3o7xyddICTzM9am/XQD3utYOsEZpa1EjyYxs7X
         6QunZdQhbX095QFgceSxbBSO7Kwiok6SN0zRgsJqDe/EkeP2PZJO1NrdUQkCpVpFmVxq
         I4QwWXy2PbMBKwyashnNcsvqJj6VZevXpnT9CM698beC6M2c3ybsA4sr5Vb+fvF+Zhzf
         ncM7TZKj7jqzX9g8moiTrZ9Rr4jp5u4mahGfZULheLQfDX4ymuuAiOftRkNNHYxRMRfy
         uXv6GtUWdXRMLTofeCHX8GmS1+mwQCONcLUah2TTPRm/E8B68E/aCZSvCclywrBfOkSy
         Mpig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692681136; x=1693285936;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=y49tMxZ0YY48F/gzN+18jldmFoxIYYQIj22aWek7pLI=;
        b=O22PDk9+gaRki87FyvAFaX/byWoOJ/PkEMD78nbdIg4Gev/ZKmATuFHs6nqAznCvQg
         /29COyhh0W7gkQEZwJ47wGWF56P2izmhRsJ1XFok5gs/I5iJd4gD4w7b++ybi5L3alIz
         ghK7Tcz+v7/sqycHHJdLPSXhtXEVSVqpO5s+74f/JoTp1m3M6eidx/2lQuFSOHmH0hgm
         jBslJuxDQTYottV50TE5ZHFDrktGNltBQPeoVeycWtIQxBnx74+OjB9KxXr3o/+pTgHG
         jEk0aXA8z74kZTRsyvy1MWAe1sqh/R7vY+bvSBGF2MP/3qdfZ7suBFIHYG66dQyWL5NS
         RKGw==
X-Gm-Message-State: AOJu0YwkhQQCE9+DtSOBSdv/B8OGT/MezUy5P2AiN+x9MCmFYWTgwFFA
	61f1cejDewVAEWHl+hiJ0P46prhEF6fUXZvqQJg=
X-Google-Smtp-Source: AGHT+IEQs81Q4KusiC28vK3V6P5+x3LAR0lCRrupgbRgEYSKykvPJ/zIapXaq37u0upbNb5/Fn7lcB19OJKAD4QiRPM=
X-Received: from anikett.c.googlers.com ([fda3:e722:ac3:cc00:4f:4b78:c0a8:2551])
 (user=aniketmaurya job=sendgmr) by 2002:a05:6902:1894:b0:d12:d6e4:a08d with
 SMTP id cj20-20020a056902189400b00d12d6e4a08dmr85489ybb.7.1692681136473; Mon,
 21 Aug 2023 22:12:16 -0700 (PDT)
Date: Tue, 22 Aug 2023 05:12:09 +0000
Mime-Version: 1.0
X-Mailer: git-send-email 2.42.0.rc1.204.g551eb34607-goog
Message-ID: <20230822051209.2837818-1-aniketmaurya@google.com>
Subject: [PATCH] dt-bindings: i3c: Fix description for assigned-address
From: Aniket <aniketmaurya@google.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>
Cc: linux-i3c@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, joychakr@google.com, manugautam@google.com, 
	Aniket <aniketmaurya@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230821_221222_313154_E4986E60 
X-CRM114-Status: GOOD (  12.10  )
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

assigned-address is a valid property for I3C device with or without
static address. Fix the description and an example for the same.

Signed-off-by: Aniket <aniketmaurya@google.com>
---
 Documentation/devicetree/bindings/i3c/i3c.yaml | 15 +++++++++++----
 1 file changed, 11 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/i3c/i3c.yaml b/Documentation/devicetree/bindings/i3c/i3c.yaml
index fdb4212149e7..ab69f4115de4 100644
--- a/Documentation/devicetree/bindings/i3c/i3c.yaml
+++ b/Documentation/devicetree/bindings/i3c/i3c.yaml
@@ -135,9 +135,10 @@ patternProperties:
         minimum: 0x1
         maximum: 0xff
         description: |
-          Dynamic address to be assigned to this device. This property is only
-          valid if the I3C device has a static address (first cell of the reg
-          property != 0).
+          Dynamic address to be assigned to this device. In case static address is
+          present (first cell of the reg property != 0), this address is assigned
+          through SETDASA. If static address is not present, this address is assigned
+          through SETNEWDA after assigning a temporary address via ENTDAA.
 
     required:
       - reg
@@ -163,12 +164,18 @@ examples:
             pagesize = <0x8>;
         };
 
-        /* I3C device with a static I2C address. */
+        /* I3C device with a static I2C address and assigned address. */
         thermal_sensor: sensor@68,39200144004 {
             reg = <0x68 0x392 0x144004>;
             assigned-address = <0xa>;
         };
 
+        /* I3C device with only assigned address. */
+        pressure_sensor: sensor@0,39200124004 {
+            reg = <0x0 0x392 0x124000>;
+            assigned-address = <0xc>;
+        };
+
         /*
          * I3C device without a static I2C address but requiring
          * resources described in the DT.
-- 
2.42.0.rc1.204.g551eb34607-goog


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
