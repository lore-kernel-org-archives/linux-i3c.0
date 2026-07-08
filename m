Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A383C43458
	for <linux-i3c@archiver.kernel.org>; Wed,  8 Jul 2026 15:20:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:References:In-Reply-To:
	Cc:To:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0rFJnE9avC2Ree7e/JtO/hfj8PVpN0LzHpqXmRUmmrg=; b=DEpHmG1oqks6kS
	pfX3XfLuncJC/9xoPDptFMhRWzu4VT0VvyQXzcvhOq7vAjZuk3Wsl3KHqke7ByQ6iH+raS9n+XYaA
	yDggEJwtwp2Ld3AgXn5V5tLZyFzIGbUFxukwv/Vl34GpJi3i106y76LAxj6gXX4Lgf2yGuJ++Vbpj
	stNM7+GXMAeOT7EPCOUttKujByqqfmmYYgogwL5tEb0IBrgj/rAEdt+vcVB9ja1DMXxqE0RxwT4/Q
	SxTCJRYSTUbIMEHeoPe8o+EMzhe6Xw6s/Ql47pZCqm6lzBkFgk0DIniRHgC6EFzZYGeuv2VY2wq6D
	v/upoOdX17bihKS7YpRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whU4J-0000000HSRX-0FfY;
	Wed, 08 Jul 2026 15:20:11 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whU4G-0000000HSQA-19e2
	for linux-i3c@lists.infradead.org;
	Wed, 08 Jul 2026 15:20:09 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-493bb510ce4so5672965e9.1
        for <linux-i3c@lists.infradead.org>; Wed, 08 Jul 2026 08:20:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1783524006; x=1784128806; darn=lists.infradead.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=CHzrrzSnVqIsHsO09qrkEkxGis4AbbzO3jB0Pw7dZJs=;
        b=HYvMCqhOQF5e/2vh5AxviC0bghsiydcMepURzBUaialr/eIjMxZWtZMyw+v9+inDZ1
         T4Dz4qLG9/veFdJa7Fj4hthQ8An4IrHFOzq6mk0EYP2P6rjgnXK1MyUhw2vF6GJuYJbJ
         TaT1Cs/S06xLCxszDUHJAMyWIgK/sMsJxW5AhCw4uhT49Qi1OEEIooiPTAS5D82GojeU
         uE0E+Lf3hqYOMB6O+i2jo1rgo15hShuEsoAV5a5FRnJjGt1NJe+53+WQG0ws1Qei8cFf
         MvB8yGboT/aiP/bA4pqqGDaOGW70QZVZPSqmtSLatEhRSQk9YaCDS9ADjiiSsvvRal8y
         EsEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783524006; x=1784128806;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CHzrrzSnVqIsHsO09qrkEkxGis4AbbzO3jB0Pw7dZJs=;
        b=SmNJZ5IN8beAUAGCRyeKV85QhJKo/oJXQVH8BlonDKsQrfbtKAJySikg70r4Dta/Ui
         8wD+pqcOuhSobeJ1L2zTVF1x/qYhqOn4ID/ITE2lNpiDn9tvyj13u62gSRGUaZQKzihE
         fiCaQ1JHO62rLZyIKbm7/vQ/PYEnkUnA6eS8I7PmHTxGIfBV6EU5OFQ6cRaz2AF0SfUn
         d0e6GwSNipYL/mLXvu3f/neFB0zSFc4NdppErUgcjUer44mJ9JfrXodPRkH+QeOYHMAT
         iAxc8FIoejENd1lMhUkq7fp0WlwLAA+9sn541+dvehO+SY+Wv7Whu5jyCHGpho8ygMqi
         bYSQ==
X-Forwarded-Encrypted: i=1; AHgh+RoivlU248j3OU7wASspuRSbzoDFCQoLOlIr1au1qer8qGF5nUtM9eilfEMsNXrMcWUFiNOeIrJMT7s=@lists.infradead.org
X-Gm-Message-State: AOJu0Yww4VLQXjkxUwBhhcsQtJFfRZNW/LIXX+iQxPNSYA2S3+Q0AzmM
	ynO4LAlwQdKjnjFLF5V3mU3dZAA4kEtGXcx2J4qwZOXIE08loPiqYreI4q6PQ/DFquaNI0Ym4S/
	HQdPnH9Y=
X-Gm-Gg: AfdE7cn2IUT8BODxUul7nAjZPs1Srlf1NSabOv/IMAIsQUOqskQoBfbH8O2H90CUppK
	XqE6UF8duf2NQb2hm6x99WvdKKQdIxdjqz99weyM0hY4hTJDXyBXvaW/1Rq50sz0nxTkQZX+vgW
	wo/pY+A1Olq7aC2M5GAMfXJchSbyLdMwEMfvMhqnB21TYjKs7iCTKBIfSjN2EtXJ3FyxIBxxvmR
	X/tUFhyFd4tsw1CebPUyZRPC3RfrBqsiUPiFJCsIwJL2HILVXEwd6rKAMxnhUo+ZJFfCQx5qi4u
	zHubC6aEm/IKcDUri6jGq+cOjVGNmVpypai/TBnE0S4gUlXmvHvtqCAP8DvYiTdv9GZXecYyTAI
	TfMY2wdKfoG+IH8kusgXhkUS5ZtGZ4IjhfeodU2OLRYQeiLH7O4bIaMMPrUAfKAFtfynT9SczHM
	GGiABCp+UFK+MwkHHIXucEcqjOc6HbMgjvOA0Ch/h9+EmUx4P5Nhyu
X-Received: by 2002:a05:600c:34ce:b0:492:4911:8a with SMTP id 5b1f17b1804b1-493e68bfa4emr32295945e9.12.1783524006307;
        Wed, 08 Jul 2026 08:20:06 -0700 (PDT)
Received: from [192.168.7.218] (88-127-185-231.subs.proxad.net. [88.127.185.231])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-493e0f3676dsm152501015e9.5.2026.07.08.08.20.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 08:20:05 -0700 (PDT)
MIME-Version: 1.0
Subject: Re: [PATCH v6 4/5] i3c: master: Validate GET CCC payload length
 and retry Direct GET once
From: Alexandre Mergnat <amergnat@baylibre.com>
To: tze.yee.ng@altera.com
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Frank Li <Frank.Li@nxp.com>, linux-i3c@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Jorge Marques <jorge.marques@analog.com>, 
 =?utf-8?q?Przemys=C5=82aw_Gaj?= <pgaj@cadence.com>, 
 Wolfram Sang <wsa+renesas@sang-engineering.com>, 
 Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>, 
 Miquel Raynal <miquel.raynal@bootlin.com>, 
 Adrian Ng Ho Yin <adrian.ho.yin.ng@altera.com>, 
 Felix Gu <ustc.gu@gmail.com>, 
 Manikanta Guntupalli <manikanta.guntupalli@amd.com>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Adrian Hunter <adrian.hunter@intel.com>, 
 Jarkko Nikula <jarkko.nikula@linux.intel.com>, imx@lists.linux.dev
In-Reply-To: <b467f01edfaaa0710f30e719ce7f2753b06c1a3f.1783493868.git.tze.yee.ng@altera.com>
References: <cover.1783493867.git.tze.yee.ng@altera.com>
 <b467f01edfaaa0710f30e719ce7f2753b06c1a3f.1783493868.git.tze.yee.ng@altera.com>
Date: Wed, 08 Jul 2026 17:19:44 +0200
Message-Id: <178352398481.1152337.5612091417598122410.b4-review@b4>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=535; i=amergnat@baylibre.com;
 h=from:subject:message-id; bh=BBen1slmhyf3fNvsg7q5c4rkJsBFClN8c8AiUxc7BWQ=;
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBqTmqiTQ1rYO8GDztzO+9B2umFemmkdZs7MFhoy
 ESfmnQstfWJAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCak5qogAKCRArRkmdfjHU
 RcNUEACNWK8pbRiPjKANkZ4jeEENSyt0IX6HsnAyxQv4ppMPyrZ1dYD8MITnulU19VAsQJhV5Hi
 ojameuWr4iIb2TXJ5ikFi9IH556sBOK36r8tEahFHG+YJe630/ByNMlXh5lZ7d3YEYCEtqPE+dT
 5zrqNNRH4VakQGxf5maivJpeoToQA4/Dz9z82qX43C6ZmyWzpOADASeoh9Luzb6dZFnqb9YwmjF
 XtSsv823lxvlZZdSb2JvMG020i5FpgkvIXtoNngFisjRgQfBWFmYZrYID2a5PVSV2QD1HLwHUPR
 aKrE8Ro75R7qEpx3eP/xMWsloFBxuLwuigzWAHiXxr6lyEUgZ1uwum8nJP0SfkUPj5rAJXoXY88
 mYl6x6DjfN3ZiLbp9S8m6bTes46lXAHoPiTvoGxpgwMNFmLTsbVsrnlHFGi7+Q+l2CJepeabOOO
 vfKEXk4WjeTrT0pjYL+3Zs8B9F1HxLm3g1WrxqPpH2uXDkB8XTEkdzR/L9WblVHrQZH+ygxG211
 PkKLeh8EGRDahSsRUDcDjXxt0miVGQr+aimm+p0xsGSaeQbayYTvmkuCBWecuD4ObTQOYlTmJ6z
 InagyA7bafmaV0AnRUXgZu46snw+rxIs6E1tI+MI2kwmQwqLr4dHFL7/NAhCvFJRWiIso8nNDUI
 CJdyvB768fIMaYw==
X-Developer-Key: i=amergnat@baylibre.com; a=openpgp;
 fpr=231B5ED7F3EAAA700E60FE8B2B46499D7E31D445
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260708_082008_338169_1967429F 
X-CRM114-Status: UNSURE (   7.36  )
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

On Wed, 08 Jul 2026 00:17:40 -0700, tze.yee.ng@altera.com <tze.yee.ng@altera.com> wrote:
> Add retries to struct i3c_ccc_cmd. Validate GET payload length in
> i3c_master_send_ccc_cmd_locked() after a successful transfer.
> 
> Retry failed Direct GET CCCs up to cmd->retries times when the driver
> reports failure or an I3C error; validation failures are not retried.
> SET CCCs are not retried by default.
> 
> [...]

Reviewed-by: Alexandre Mergnat <amergnat@baylibre.com>

-- 
Alexandre Mergnat <amergnat@baylibre.com>

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
