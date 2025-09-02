Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3766CAC59D
	for <linux-i3c@archiver.kernel.org>; Sun, 14 Sep 2025 20:33:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=hA6FONA+jBmTijNtAI8fMvaLd+AUvrWy5A6Mm+mNwb4=; b=F9l5yX81OAgMcx
	6XIVp4Nzk04AFsacRHo0y1HpT886BigTG3KTR0RKP1akTXeABAIrsVFdV1moAoigQNX4yWfxyfsCE
	yOLqD4vhHwfNXJBgwYPt/RvplaHkEdGSpZXfYvR0km+ircOW1xEy5UjFt9l+9wXTPRTBt/QIaqfTa
	40yd+dLr+rc/PyS+KFFmNh4qksjt3ukY52HSqc6OY7c1gKMoI5zsydoKKqn0OKiFM1rBtLJHOFSR0
	cU9yQ4gJJosIPkFACCmtRXCcuYYtSjwRdJG1XexAN58Nn80bp7sW68nWwEOK7/P4WslNtGPDJVT0T
	MR6DvXbgCdgDSb5U5COA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uxtPe-000000029oj-2qgM;
	Sun, 14 Sep 2025 20:33:30 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utRRw-00000000B2V-31DY
	for linux-i3c@lists.infradead.org;
	Tue, 02 Sep 2025 13:53:29 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-45b8b7ac427so13927665e9.2
        for <linux-i3c@lists.infradead.org>; Tue, 02 Sep 2025 06:53:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756821207; x=1757426007; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=sFT8uhGng5M0xnUvfOPSpBoi9A8zPQ2Ye+1CG2fVnso=;
        b=b0dmG85Y3vaAqTWq4tNgFWJHEhfdVxq5STu2hY23gol2EYbyQSRJbEOkWxMStUDGOo
         wfxqov2xR633N4F8iCp84anBYpOwcDV3wkHQeZ3I3owW0B3ShOsx4apogN2mHdqRx7as
         2Zvb/yf3zgkwSQFXr8ItWB0sSyrJAQbvZWj17r6ywuSTvG884+/7VrTBIhP4LW8AQ6g4
         72Y3AinvFkFbsD+y39cmjBO1t4UB2lnAPo/EmW/pW5N80f9I7uspmsvYY1GEduCQOCRb
         8KRAvdyeht/2gA6XPchwrIIN3IRKvWuzYK74KmCI/JV1AXQSGP1mUzxwNNEX2RaBzac3
         mJ3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756821207; x=1757426007;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sFT8uhGng5M0xnUvfOPSpBoi9A8zPQ2Ye+1CG2fVnso=;
        b=JD3EH1Bh9mFyvKqDz7GFEdkLTuj87rzghXbZym9KAw01M4RWuIYBW/B7+a1AiaWFmV
         Pr5RrO8IQRTVo7bMETMj5Etmjm8tMtBj3CtSPZ+/SZ/AyFuNFwRXnDLNVQKWh7Y2SjV5
         vodrDoaJThm0CAG8jSqR+920SEzQ8aidQEpATeU08kUgXycxVd/PXaSsjfqd2PNDSB4O
         hLScDYI2fp23USZ/ejREE8MD4qkrtv2cJkGGTutwpTqbsVwriagnr+fHVUVCK5O2i6pj
         zyldlB3kZ9w2glReLxMwlevwefdemrz24qdnPNzFI2xrLD8ESzULrJqQNreBbVtWVMoF
         LHHA==
X-Forwarded-Encrypted: i=1; AJvYcCWXtAR8c8fqj2i7FYaBABjBa6FBS2wn87HjyiOncWm3lPRR6A/4uB3hgGIaJ2KGJnXPjKSLLwTx2hU=@lists.infradead.org
X-Gm-Message-State: AOJu0Yz+r43MoUZMxU965zi7F6wwggC/WV9fqGX/E4qiJL8WRWX8zM8a
	vNW1eemk1gNfqmWq9yPidY8H2GKGG587eFZUwubWVQ0a/I7uzlQHS473GhioOI8LUD8=
X-Gm-Gg: ASbGncsD/6aa/LM/1sqmohT74/TUBuHUFthbnYqbdjwcLHv7o6jwhzZjXDnbE4TGQEV
	Bx4HGLfdT0XhkGCHoOFdwPLpQDjTXTZWwI3riMdJtDe+QDqBxyOc0grleJfPnOWq/Q/mrNURTBM
	6HzlUxFpY+G522hisP1PZeR2GxQinbyS04/UIyy2kiGsLAH+a/4IPe8MJYUbS7ubFVZIOwsdO1M
	3rs5Qa0rhWhT4xiv1lZ7x2i3pJDqQprBkHr+QzLCP9TGgDzwMh+Ct6dwkM40Yjd7hi7bWPiZQoq
	oQWQ0S5epCDI0QhDOM8K6dS2cWxeMPutLERDFhd2KVXQUUWue+jekI3zdVKdKmRwSY6Co9+xMR+
	/G/0HfXMVBhAAmOUmrA3cs6QE/B2fVGw=
X-Google-Smtp-Source: AGHT+IHjRrWvopx4QsWSeRb/F70NKN9Z74OQ9n/HQdOFnq8W+nkDSUExmV1RxO1Z1ojlWiFxP1CHOw==
X-Received: by 2002:a05:600c:1d06:b0:45b:6275:42cc with SMTP id 5b1f17b1804b1-45b8557a3f7mr88649505e9.28.1756821206681;
        Tue, 02 Sep 2025 06:53:26 -0700 (PDT)
Received: from localhost ([87.254.0.133])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-45b6f306c93sm283628745e9.14.2025.09.02.06.53.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Sep 2025 06:53:25 -0700 (PDT)
From: Colin Ian King <colin.i.king@gmail.com>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Frank Li <Frank.Li@nxp.com>,
	linux-i3c@lists.infradead.org
Cc: kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH][next] i3c: master: Remove ternary operator on return statement
Date: Tue,  2 Sep 2025 14:52:39 +0100
Message-ID: <20250902135239.2632286-1-colin.i.king@gmail.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250902_065328_761230_AAC95623 
X-CRM114-Status: GOOD (  12.39  )
X-Mailman-Approved-At: Sun, 14 Sep 2025 13:33:24 -0700
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

The value of ret at the end of the function renesas_i3c_daa
is always zero since previous checks for less than zero have already
exited via return paths. Hence the final ternary operator checking
for a less than zero value for ret is redundant and can be removed.

Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
---
 drivers/i3c/master/renesas-i3c.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/i3c/master/renesas-i3c.c b/drivers/i3c/master/renesas-i3c.c
index 174d3dc5d276..275f7b924288 100644
--- a/drivers/i3c/master/renesas-i3c.c
+++ b/drivers/i3c/master/renesas-i3c.c
@@ -679,7 +679,7 @@ static int renesas_i3c_daa(struct i3c_master_controller *m)
 			i3c_master_add_i3c_dev_locked(m, i3c->addrs[pos]);
 	}
 
-	return ret < 0 ? ret : 0;
+	return 0;
 }
 
 static bool renesas_i3c_supports_ccc_cmd(struct i3c_master_controller *m,
-- 
2.51.0


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
