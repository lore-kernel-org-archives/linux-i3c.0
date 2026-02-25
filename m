Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38F20E9B25A
	for <linux-i3c@archiver.kernel.org>; Wed, 25 Feb 2026 06:35:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To
	:From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=glXansJYfHoLi6FJNDT5V3pf7EzB5KBkBMTU6wY73AQ=; b=CXL7leixOOOXGA
	EMLGZFHHHXo954ITCxBMiRHsZi2s7W2DCdRVesYTeK2qBWo94zYlOIun5YBQH5NJY4WmXmnX2KsDr
	ojN7KuEmLH4u+qumd2dFCbmqBNiiwTM8/MhLQDcTzspWm0cQVFrcXIabTpMeX1WHOPDFgR4/s43k/
	EksC17h5RV1I9Rei/7k28Pd2K8SWI3QuF50R3wle1f3yleg3YzxaPKazI6tE/bg+0FSFcEtbOksmT
	aVQz6DqU8qNRt5HyCGy07dCRNVHTUrNHAPEyrVHjEXQSCVpgPybfR6Kh51XjI6N9S1y8UfjrcgZyP
	XToeIU+HnLA3tb3lFGrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vv8Ug-00000003Lep-2yyT;
	Wed, 25 Feb 2026 06:35:34 +0000
Received: from mail-pg1-x52b.google.com ([2607:f8b0:4864:20::52b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vv8Uf-00000003LeS-0a6A
	for linux-i3c@lists.infradead.org;
	Wed, 25 Feb 2026 06:35:34 +0000
Received: by mail-pg1-x52b.google.com with SMTP id 41be03b00d2f7-c6f306faaffso2285195a12.0
        for <linux-i3c@lists.infradead.org>; Tue, 24 Feb 2026 22:35:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772001332; x=1772606132; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=PylT6EFDCwn4mTA8NFLu7w3IdV5TmYSoPHCSQZCaPGw=;
        b=b4C7rMwuFOgS8LU4wU9F7pJBOhhOwWJogHs8ZgmvVw0lpHv6xSuK2RL6SH+fmobV01
         5YACjhHRfCFFBWnXHLjbChO/83LMUPbwwlNBCi76QQSySS1JRvPKBxu/N9ET6AkxTwEg
         38FHWAgZMwBzCUBlXEi4fw4iNPZRYTuGZB1cA0rnc9VgX6ZnJN6br6IdKwC0NPwB+QUK
         snDGnVtqKYeGyLH5y0AWHhZBH53SYzPK5BEulb8JnbKLO1hOSd/5ENVY3JyFpUb6hk4w
         D+zi+pboe4ZVok71OlxJKOn4foPPk5ciOAjp2QRO3C0gIJjCsPaCMhq4fnsnmHpZ06If
         aGJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772001332; x=1772606132;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PylT6EFDCwn4mTA8NFLu7w3IdV5TmYSoPHCSQZCaPGw=;
        b=Ohp+PjidLZcPIfANKD9GCDpHWB8OW/stLqavhnFPd/jsLFevMcxzUlF0D0MFL7qN1n
         m14SYL/DV6vOJsgD61deWK0AEeD4BzGCiN+v4Y61gQKhyaOIpD9Y6SeAa3sXs4r+dhWK
         ThE7BUB9ilHNKZ7SfFttcBGVvPbhuT3r+agS0NTArNMIU6ETVyPEb9YRef8lquhpO/tC
         U9EVK5tBlYTz34VyJsg8qII91VISxiEZ8bMzv0opWkpActZRaFjVyM5Y8sOYg7/pMfQM
         cG55WfujSIkcATlG3N+0Pf3w4S8zhhexk69MnBGqb0OLGMj+mdTH0NV3vH2mrZKbQU/0
         oceQ==
X-Forwarded-Encrypted: i=1; AJvYcCWxbADJl4kumDc95fJ/HxcdX03Ci4aGWm8AiLg5vL3UvzSJSTeN3J5cWfUV7InRhUEOlrvzf8Wis1Q=@lists.infradead.org
X-Gm-Message-State: AOJu0Yy6qwjMhlUvX13NQXT6InzTnTSjkaEABNIEqiENL82m3IRK4Ubt
	NlN4fdIT/Sma04Nmn3y9ZA6BPQ1OfJcsPHO2+cSPM0tJHEJcJbzzK5sM
X-Gm-Gg: ATEYQzwTBV3PBRy7HsjSD0wH9PeaYqqunW7YYTXse1gCPEIkypA4FnczJQtJ5sP5MDR
	XTd9CBu3/vUCJHQGzCYEDUSJgxCZ5V335nYiOiB9h9ptNEy7BwvCdQpHT/UY5A14YnPG5/xi5dC
	HoWl5hHxf9BYiHnwa4gb6106KH+RwQQyog541ZRDOW+g9shWpi5kRjseucon2He/Y2xsk778wXM
	9KQc6SSkUYx3jemXFrEbz1/U+tf+g3sbkwMwdutIl3jP4Am0BwCCF6NLCkNCpP7BJegb+kyoD32
	5/TPDdOPSXUPv4RhuVR9Zs8WgMAwGAXTZAcCJj5OgLCA6bHXbqoN47jw7bscGmC3N810DJrQjxf
	bPNEdzuHJyOSRf48kIOyQmfg8cP/SiSQ9cudzePv7GMg0YDO9Tt87LxmAZpqUqw13U10itXgOBu
	SHkNwZI/67DlKeTFzLyRg6ByDDzTBuUaUim24IqP2XiwA+Q3559xfe1aXcuDLrnPFd8g==
X-Received: by 2002:a17:902:da48:b0:2ad:6e0c:620f with SMTP id d9443c01a7336-2add13dc36bmr13341695ad.43.1772001331639;
        Tue, 24 Feb 2026 22:35:31 -0800 (PST)
Received: from eric-N-A.. (61-220-246-151.hinet-ip.hinet.net. [61.220.246.151])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2add10097e4sm16606175ad.49.2026.02.24.22.35.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Feb 2026 22:35:31 -0800 (PST)
From: Peter Yin <peteryin.openbmc@gmail.com>
To: Jeremy Kerr <jk@codeconstruct.com.au>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Frank Li <Frank.Li@nxp.com>,
	linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1] i3c: master: ast2600: Fix missing of_node for virtual I2C adapter
Date: Wed, 25 Feb 2026 14:35:28 +0800
Message-ID: <20260225063529.3230676-1-peteryin.openbmc@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260224_223533_198672_5AB45D36 
X-CRM114-Status: GOOD (  10.27  )
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

The ASPEED AST2600 I3C master driver creates a virtual I2C adapter to
provide backward compatibility with I2C devices. However, the current
implementation does not associate this virtual adapter with any
Device Tree node.

This patch propagates the of_node from the I3C master platform device
to the virtual I2C adapter's device structure. This ensures that
standard I2C aliases are correctly resolved and bus numbering remains
consistent across reboots.

Signed-off-by: Peter Yin <peteryin.openbmc@gmail.com>
---
 drivers/i3c/master/ast2600-i3c-master.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/i3c/master/ast2600-i3c-master.c b/drivers/i3c/master/ast2600-i3c-master.c
index e05e83812c71..a1c6c9d97d11 100644
--- a/drivers/i3c/master/ast2600-i3c-master.c
+++ b/drivers/i3c/master/ast2600-i3c-master.c
@@ -156,6 +156,7 @@ static int ast2600_i3c_probe(struct platform_device *pdev)
 			i3c->sda_pullup);
 
 	i3c->dw.platform_ops = &ast2600_i3c_ops;
+	i3c->dw.base.i2c.dev.of_node = np;
 	return dw_i3c_common_probe(&i3c->dw, pdev);
 }
 
-- 
2.43.0


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
