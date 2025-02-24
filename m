Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7FEE3C021B6
	for <linux-i3c@archiver.kernel.org>; Mon, 24 Feb 2025 08:59:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cSP+T0V+c+k9cib35kPvkp73d25k+nWrWDOekV13lQc=; b=X+4Ei1JnH3AnB7
	G+Mgk7YKXTsjSVZnyc2tjoGSXiGWkprdn/H09EskspzquDWshO+J/XuA2HAhWfZM5pEI0tXp4zA/a
	tSI5YjgmP4uMtmuXbJEXQrGpU1eSHdHrysFdmB8SdaJDYM9J4XXVoVln+acD6IuwhQV7q1QIez4RX
	zRbiy4KoTPxXvKBIGVbdtxaXS3VdkP47hLUWP5b8M3fxeRPplQhk8KVBjswxHyOW5qkUymen/lf32
	nO1g3u5vGpBUa+vGXHnxkv4A8ruJWT0iEd5eJFVyoJJzzb10QX9AcwP7pdG8MGxuAUl2y9p7tf2o5
	biXyNhc7wlkDk2gMf6pg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmUJO-0000000CnL9-19fw;
	Mon, 24 Feb 2025 08:59:38 +0000
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tmU0B-0000000CjOU-33pi
	for linux-i3c@lists.infradead.org;
	Mon, 24 Feb 2025 08:39:48 +0000
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-220f048c038so76270555ad.2
        for <linux-i3c@lists.infradead.org>; Mon, 24 Feb 2025 00:39:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740386387; x=1740991187; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=95SHW6HzB6iNhL/wzrH3WG7qpOIgT6dZkumEvj+k6IY=;
        b=e69NpbTixVMDc7hIxjxzG27RhhcpBpTA9a9jVFQvrmg0UkQesS+2j6+pzKdnQcHqy7
         edbdlrY8ZYK/FCSFkN7BHzSiS67qtcDqajOmrZJ+tJhNhNpo/09NgHL9fdjIhHLpW9qm
         z96k/cmU+tiZGGuR92jJvAZJ4amEOvRHA+MDcXL2bXsgDx5GhDjecXVRMMf2onOCfFsg
         pP0C3NFH1TQwQSYPo7TqB5BOaQ4TOmlCEuNJ/EkuC7jTCpMLHZL0BQppsIWMCzVG5/21
         yRnJ7/4DhChAemimV3cfF1PKA2cPv3yKEktONj81Qb0/1vFdIsz8vjTuILj5MLAcCNgj
         3Y5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740386387; x=1740991187;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=95SHW6HzB6iNhL/wzrH3WG7qpOIgT6dZkumEvj+k6IY=;
        b=dgWOqbiZS/64tSo9CPvaShmOXO9HHu6OFsg1gQVChFYxGQwvYGYDKMygkTNXY3YjOp
         woC3RzP7FUCvrJH6NxFX55ELDNn19DLy3zLToNEcEPz6Q34vQx8WlSAgijRvfweSeGo0
         Vm5HhR2B+s3/S8toFSZYDbMhJ7+TBGCcbl51Ak/SlbXQzVMa5UnWMBmbUeBzsmgoJtCY
         1me9o/Sk8Dqsrn+j/XSXDQtwtSv+KnLIDwlMJpSBcQQSBc/CErJ3QFY5tHdRIHayEKjZ
         npXY/OGCMheJ17qAyWd94lfTvOQPr/FRcQ1y8q0ZeRHyHgKOjvj3NeS+hyICb330juKc
         9JGA==
X-Forwarded-Encrypted: i=1; AJvYcCU+5HCuCiAARpMdVSUr9yCkqytBWyuJjpI+XW0U5ur4FJE5jTgzjuEkuse6uil91YwUPgjQq+A14kI=@lists.infradead.org
X-Gm-Message-State: AOJu0YxASPfmJJVvYRNmxGqNPWNud+yYVZPOxcRB/WBuyTqOVre9t8Pp
	2SPz6bZkHzobcxnPSwMmpDOqbug+xpG9OgOygpO1Zfu0sg6DDX8U
X-Gm-Gg: ASbGncv4FAX3OIeSh7FUQRjjyxKZMbfac23thM0a5S2GiXXzrUGMON3ge7DBt+umH4M
	/TbfkI7Ym9BnXdkDBdgS5LOma1xT27G+UzRlvs++mZp4bN7NmsUJyLmEgheoD0EL4/ftJ+NTN3p
	jQKysuC5lBbAnjy4TiKqpsPinrQJUmOYZI+riPrrgOJ8zi42b+2zt+RntnGwk9T1/w54toXnn01
	byaBMyYw9DWv9k5vcUr71T7TWHYZCsr+ylp/JDZIS7IVndPXScDteiwgLo7IXbF4dAQZ5W3cjb0
	RUR2xJsF6ral521LM/DZlIrNPapHBitmGVtm
X-Google-Smtp-Source: AGHT+IFre9XOybV0YxAiqbX3XhSPOqNf9uDTbDbMVVNdbMkg+GELuP1pFb1lBJN/C9iaOtzknuA7gA==
X-Received: by 2002:a05:6a00:2ea9:b0:731:771:38f2 with SMTP id d2e1a72fcca58-73426cab14fmr26237456b3a.8.1740386386696;
        Mon, 24 Feb 2025 00:39:46 -0800 (PST)
Received: from cs20-buildserver.lan ([2403:c300:cd02:bc36:2e0:4cff:fe68:863])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7327590ff12sm14634793b3a.115.2025.02.24.00.39.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Feb 2025 00:39:46 -0800 (PST)
From: Stanley Chu <stanley.chuys@gmail.com>
X-Google-Original-From: Stanley Chu <yschu@nuvoton.com>
To: frank.li@nxp.com,
	miquel.raynal@bootlin.com,
	alexandre.belloni@bootlin.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	linux-i3c@lists.infradead.org
Cc: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	tomer.maimon@nuvoton.com,
	kwliu@nuvoton.com,
	yschu@nuvoton.com,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v4 1/5] dt-bindings: i3c: silvaco: Add npcm845 compatible string
Date: Mon, 24 Feb 2025 16:39:04 +0800
Message-Id: <20250224083908.1880383-2-yschu@nuvoton.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250224083908.1880383-1-yschu@nuvoton.com>
References: <20250224083908.1880383-1-yschu@nuvoton.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250224_003947_769120_7475C16C 
X-CRM114-Status: UNSURE (   9.05  )
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

From: Stanley Chu <yschu@nuvoton.com>

Nuvoton npcm845 SoC uses the same Silvico IP but an older version.
Need to add a new compatible string to distinguish between different
hardware versions.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Stanley Chu <yschu@nuvoton.com>
---
 Documentation/devicetree/bindings/i3c/silvaco,i3c-master.yaml | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/i3c/silvaco,i3c-master.yaml b/Documentation/devicetree/bindings/i3c/silvaco,i3c-master.yaml
index c56ff77677f1..4fbdcdac0aee 100644
--- a/Documentation/devicetree/bindings/i3c/silvaco,i3c-master.yaml
+++ b/Documentation/devicetree/bindings/i3c/silvaco,i3c-master.yaml
@@ -14,7 +14,9 @@ allOf:
 
 properties:
   compatible:
-    const: silvaco,i3c-master-v1
+    enum:
+      - nuvoton,npcm845-i3c
+      - silvaco,i3c-master-v1
 
   reg:
     maxItems: 1
-- 
2.34.1


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
