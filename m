Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 156E1C43602
	for <linux-i3c@archiver.kernel.org>; Wed,  1 Jul 2026 10:37:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:References:In-Reply-To:
	Cc:To:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4aEHgpBrsStuhF/hiqnbu+rTktzAMkghNl3bTARshGM=; b=0FTBKj7R1obGhL
	M970KGYWT7m1pVI0CBgJjN+O4vo8OntkQtOKutDSDduWujpne600nQJ9bF6mRYqyEaoc6obOs5FFr
	o8ep6KWuYeCZ8BnBqz7FCV9jRaeovu79xUwb63WNhaybjrOo70YZPML++JmGtOKQAMZL8YRmbb7HE
	4TJ9zQN2KjLctAHEJJ3i8jgqPg1zEkdH4NMo1xpN6nO0RVfB0stU7LwBlauyK3A+obBDIgFdVQz+R
	840D8ycFDCqymRI0i6QJo7jJlda1Ir5/q4Kn8XQBNfqLb+uFx0Ydc5IoeAbELaIsb3s8HNLaLPHdI
	FPCQQPJLFg56BeGsarWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wesJk-00000001KCT-3JSt;
	Wed, 01 Jul 2026 10:37:20 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wesJg-00000001KAQ-1ggu
	for linux-i3c@lists.infradead.org;
	Wed, 01 Jul 2026 10:37:18 +0000
Received: by mail-wr1-x436.google.com with SMTP id ffacd0b85a97d-4703bc0a99aso262083f8f.3
        for <linux-i3c@lists.infradead.org>; Wed, 01 Jul 2026 03:37:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1782902234; x=1783507034; darn=lists.infradead.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LrDaen+lp228qVG+WoF9YXULRRbg1Kot0gRUpiWERuw=;
        b=R4ZZXQaWtfCBEoCKVPNeGPBstIX968HimjKZLsJYLMN8hfhAZodNWd3Ybg6SJiSwyF
         hqWZDTtRL8YEhJBcvkxOS4tqVocNdlDjC92/YfSvVKarFT4EDtvRr6NDoNszwe86rRvF
         0ZEekZu6lMjsG6hD92KCwmKsLGBj7b8xCPA/cnrp+HjSOwi3pyjlUJMU3S/bij3rwMwY
         gRbKcfRfs3cBGFyM1wg/EsLLExjBiwhbICl0W44tOgOf7h9GG/+oM06AOeVW8dvYbb5e
         WAhF701IZ9DRKxqugBWs9Nq54kQUF3GMARkpRCa8o0s11tk7KSrkxo6K3rpHNXDOZxAR
         T8Gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782902234; x=1783507034;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=LrDaen+lp228qVG+WoF9YXULRRbg1Kot0gRUpiWERuw=;
        b=bsDrNuFNwa7kGfKmSZrv2+f+FgH+noLWccyy3RvGSAoQm199iPA0SUuW9nY73O2RMv
         3LnCDtPWyCLVjimaoDH6IGF1ZpS9d9xwpJ2nalYZr9snMAj4aThBbTVLnUjKENSR6092
         chxI7k/TQJSqHUF9NXXAOG+6IB4X+mcjV7Wm8RvW+kVHHJczTMWA82gH2UxtXb8LZ7vJ
         cnNFi6Ub1DNxWHNQaxH2O1FFLvNw7GfYRj5NsBJL/mENU4fGXOBxRRI7LIwLcwcZquo+
         h3YegwNr5JR9JEV9W9SasYMTDtDdwr7tsY/9EpAzStnu+bM1x9r0LdbUkahB6VjMI7a2
         40+Q==
X-Forwarded-Encrypted: i=1; AHgh+RptrbgTOdFGyH3dL8QKNxTqXLwyOXif8eSP0P3Hi6iTMxCPRlp3CSyPHknWQCmZMdhGlJVVcOmoX2E=@lists.infradead.org
X-Gm-Message-State: AOJu0Yy2Kf0S7Pde60DAh7FOAuujglU1fM4fd8XStGi2lFgsij8rXQIG
	3faJ/FCVffOyaAJxrSLfrTntH2kaKthV8kGy3AN5D2fXDvQPvdtHaB8eyFCXbUlOYmo=
X-Gm-Gg: AfdE7ck7vrCYbV8UPVWEgOz0VtHykf8yaD9O95SuNoGtC/fWDS5gMPjNyuPEn5BJkZs
	1DYMWjr7QW4e81ePNmD9F1hK2+LY/0FRUxRiJrbDij0N9SGb73ys/N0zxLsTnFpG0o7O9aS3YEn
	tlc8UgEJzT7wmLWuJLnU8DBV90rLjjUQ2q61peuCPwO7Q57LCsgJgz3IKICkMXvmfxqifQA83FQ
	WMmJGuaMQ1NY8Xbd0HDOPiEu4IdBtgLxr6RFIMmTXLYy2B9mdCwFYqeC9b5QJRsDOwnlfhp4pmS
	/lBwgn9k8oex7WTXSPujZT4m3LZtgpVhlgSihFRNjjyHnmJbRaVYEiv5yhYBFg3JXbM9qF/LdYN
	knyZNNWkUfowBxQdBG9VeaE5MKEDsx1nmmNE61WOK4u3Mz/kuUi5yh9v1S0hPp1O0y81JBEkrIs
	5VWTrZG1dAA1IpOjVFyNCXdmJDK+ipRWHNL7FJcctAkcuAldzqiNWi
X-Received: by 2002:a05:6000:2606:b0:475:e7f7:ef7a with SMTP id ffacd0b85a97d-4775779827cmr1880798f8f.23.1782902234445;
        Wed, 01 Jul 2026 03:37:14 -0700 (PDT)
Received: from [192.168.7.218] (88-127-185-231.subs.proxad.net. [88.127.185.231])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-4756636cf65sm16809808f8f.21.2026.07.01.03.37.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Jul 2026 03:37:13 -0700 (PDT)
MIME-Version: 1.0
Subject: Re: [PATCH v4 2/3] i3c: master: dw: Map CCC hardware errors to I3C
 M0/M2
From: Alexandre Mergnat <amergnat@baylibre.com>
To: tze.yee.ng@altera.com
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Frank Li <Frank.Li@nxp.com>, Adrian Ng Ho Yin <adrian.ho.yin.ng@altera.com>, 
 Felix Gu <ustc.gu@gmail.com>, 
 Wolfram Sang <wsa+renesas@sang-engineering.com>, 
 Manikanta Guntupalli <manikanta.guntupalli@amd.com>, 
 Jorge Marques <jorge.marques@analog.com>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, linux-i3c@lists.infradead.org, 
 linux-kernel@vger.kernel.org, 
 =?utf-8?q?Przemys=C5=82aw_Gaj?= <pgaj@cadence.com>, 
 Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>, 
 Miquel Raynal <miquel.raynal@bootlin.com>, 
 Adrian Hunter <adrian.hunter@intel.com>, 
 Jarkko Nikula <jarkko.nikula@linux.intel.com>, imx@lists.linux.dev
In-Reply-To: <56a59c5ac9a09692f9ac8a74d1d3afdce553a7d1.1782824628.git.tze.yee.ng@altera.com>
References: <cover.1782824628.git.tze.yee.ng@altera.com>
 <56a59c5ac9a09692f9ac8a74d1d3afdce553a7d1.1782824628.git.tze.yee.ng@altera.com>
Date: Wed, 01 Jul 2026 12:37:06 +0200
Message-Id: <178290222675.176638.9993319878763029680.b4-review@b4>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=627; i=amergnat@baylibre.com;
 h=from:subject:message-id; bh=xTgTAYDfdOWljotsA1TK5aPLPK9ufujbvXK7/XA377g=;
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBqRO3WMecrUypYMWBlo+QVWhD3tezdppDrKSi8w
 EH5CvXOuc+JAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCakTt1gAKCRArRkmdfjHU
 Raa6EACs8oZtx+RWdZ4NSVpLooHnYWmUWabBKJoE//vg6kNlDF+lmfxdtELYoPFponLBNoC8Vnl
 B2poUG1tt1sBGpZBQTvtF4NkM8aTus5nZ1vPEmjxeisyIx7NplcEN8cW2ow3YXH2Dc6J5TW5V77
 vrbgiqxe6TdnHEuEkx1rNDWeBaIKXhGx2BERpvawTiXWDuGcBOzKTNBGMoe/pSAgEx+sQFRNsas
 4G85duvlMxS2b9PbcemtJmjo9SoWrrpH+iaSU0xptl7My3XEcSpmXz6RTwHzEreHx0eaD6Z3I9k
 oxaX+4W4tB4Eg+YcIkZhCGPB4WUASgtE93s9CIYNXLWENgHmKxQORLCYfEmk5b40EPcu8UsNrye
 rLxBwozlIikH/NqL5fFMAH6og3UY3mNH7uQ7tc1FCYSPdYqocCYVVzNRyZeOEAUNn6hux8b4aUA
 Du+OuYtnRpdIQOUBXcDRl5OqM+iy0FJItRqc9o4Q9KlE4Uq+k5xG/weOVjatmCOHdYW3GY/jbQi
 xRjmgImCfBbzRR8DljwRE8wGH1K9aUJweDAJnKjYwVRUOvCVf9Puc2AFuCXOY5Wu2DFBZxA6j7L
 YrOFDpXHZSxIKzK67mMrjmkQBrq9MwVXiw/2AsZJeGFXC9yr82uwkliZjJMbyqNyJZFsEW8na3v
 hF4P7m6M1XSfTzw==
X-Developer-Key: i=amergnat@baylibre.com; a=openpgp;
 fpr=231B5ED7F3EAAA700E60FE8B2B46499D7E31D445
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260701_033716_492994_76289665 
X-CRM114-Status: UNSURE (   7.91  )
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

On Tue, 30 Jun 2026 06:20:26 -0700, tze.yee.ng@altera.com <tze.yee.ng@altera.com> wrote:
> Map DesignWare response-queue status to ccc->err:
> 
> - RESPONSE_ERROR_IBA_NACK -> I3C_ERROR_M2 (broadcast address not ACKed)
> - RESPONSE_ERROR_CRC, RESPONSE_ERROR_PARITY, RESPONSE_ERROR_FRAME and
>   RESPONSE_ERROR_TRANSF_ABORT -> I3C_ERROR_M0
> 
> Per the I3C spec, M2 is the case where the master does not receive ACK
> for the broadcast address (7'h7E). Target-address NACK is not reported
> as M2.
> 
> [...]

Reviewed-by: Alexandre Mergnat <amergnat@baylibre.com>

-- 
Alexandre Mergnat <amergnat@baylibre.com>

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
