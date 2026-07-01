Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4CE47C43458
	for <linux-i3c@archiver.kernel.org>; Wed,  1 Jul 2026 10:37:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:References:In-Reply-To:
	Cc:To:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dxLLv4clZ0WKR0aVbVgnu2JmU/KF6LbeULpx9isuKVU=; b=znbeAihagrB45r
	S7TkBp7nHcyWLyrdZTH2y3TD+HVoUL/3RMIV3VW6DanD2Bgzx0XX77hOr9XQXcHmRp4wXncnJkJlL
	ve9OJI9b31VrWwtcO7xsYpAQkzP6Bu4OyGRcqoG6PWR4W/mjw9X7Y8oMJlh/YunR/73j5UqiDuyw9
	v+H9vr7MGfRm8a7WU4d5XODcOD26tPP+tfHkDWaj2swl53taW1CCeN4RL4295TTF+iDZvq+O2iffE
	fPdUw3H8MdYOFlBw6Xj+HE46OOldNb6nBNIkVP88vc/avQAbxhiIlKqZB26djz3qkynJcCiPLpc6d
	b4WrQEUqfsfBnnO/Acgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wesJk-00000001KCE-07hl;
	Wed, 01 Jul 2026 10:37:20 +0000
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wesJg-00000001KAN-02KG
	for linux-i3c@lists.infradead.org;
	Wed, 01 Jul 2026 10:37:18 +0000
Received: by mail-wr1-x42b.google.com with SMTP id ffacd0b85a97d-475417f010dso299443f8f.2
        for <linux-i3c@lists.infradead.org>; Wed, 01 Jul 2026 03:37:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1782902234; x=1783507034; darn=lists.infradead.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MJZJ10VTyXhL1d9Ttz8i+zfdNsrSf2HhHlmTFaNeGOc=;
        b=i5/yRaDYu72sKwHaA6aWTlvaFfDFFByp4D1eRuzlHy/85TCEohQe/quiiygfnvs45x
         +dmja9nbKBNmyrPP6l6qeBntPp/XZl3OR92wOV/HTRnBbANcZyPizl3go09d44r+TNfE
         YKe0+qq5GdjnfK0jnVI89Z6dCJIlZjv5BeiTQ4IAb2FtvplfOE9kABfDHiHv+6GGJ8xV
         FENcuNopunwEt9i4Waiy7jimer0jX15eE4z/px3u3NXug4PDuhEfAU/nDh65zf+tWZtp
         Skxxk2u+0pvmatc3+Id6kUqE2y80S8lKYw4VTYGV8IerSIcA73N3K4KaRiQp74FtDGpG
         TkyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782902234; x=1783507034;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=MJZJ10VTyXhL1d9Ttz8i+zfdNsrSf2HhHlmTFaNeGOc=;
        b=AJWvlAyVGlyqJzVB42CFlj/aEYHbmkU1nEd9H0cTwtpEJ/J5Y6vgfATon3WXYC6bjg
         Z0iBvVUCgOkqg1EXesqSSak6YtSERewn5J3bk7pnlcbSMAoUji2wFQbymIgOuGo7+xoJ
         r4XB+SmIyF3XWGgOgtX5ydevAdeumRw20dxoLtFfgxSSM6Y4WsoycrfidHUGIDjMnqW7
         fbl8E/CbkFhPkbOZI5HN+aiv11uLDsWtHnsngCV+BQ67y5gcKvmp68xn7kJEtJEssOoN
         derg9iGzsWI7Mf8xEkin5D1g6DDMqI9HzG1VjJqQ2Aqy1jBcqWDZmv+tmsL83gaTFboN
         GSgQ==
X-Forwarded-Encrypted: i=1; AHgh+RoiBNf7lrX/llvwiXEo0zQ6BrK0BtftpWLHVHT70qGke+eu0cZ8DgfhUp+zgOm4nFzjcKfsmmApa+g=@lists.infradead.org
X-Gm-Message-State: AOJu0Yycu4hDuEqrQOUw73f/WOO5r8hR7DXwDvGYtsZ8Ds5VMkG+E9zf
	asDp7msChdM6fEsPkSAKEwXrAYCP+T51x+UjukV1a80QQNiYGhDLV572Ro5gpHXnfkA=
X-Gm-Gg: AfdE7ckXEPwWrpKQ43xljv4qjEzUrSPxjie5n/yf9Ab1P/T5EDAhfnisOb7hKfhiUS9
	WFLqiHkZb0iIgYJUs7Of6ccc6Mov1qc3XPRzTpyaMt1uzPiBnOts+Vq59Xd59YJvQCNJs/NxlFU
	LlBmKdfWD3bAuaauDOoVGVvt8FpvLuyGWYwmAU2PIuXrGuehewMtLuLGS4nlI5LaCWIifD5PFUr
	UKbvI8VVWIfQI1Ktkz2j09owmEPEkSpDNRcFJ3jZP40dcY0+TuF/Yb9W2TLz2mLbl8C31PfrBJW
	jPcpsA4Of69apcNo45a7PDC7NDgW9LPXK14w1nhs7W+WfGYyg/5MkTMrPSTNjfy4xSMagGVN9PI
	iu11MetpH6uwK/RYI/rnJwEV2VHhuFzSE5QWCjvjUFCniQm/KNObmzvTFXiP9k1jhJ87LbjdzAq
	vQPMaTNUtM1ppsWA0Hn36l/vt/t+r5mswkki/3O3F28KbLzLHjT1/q
X-Received: by 2002:a05:6000:186f:b0:475:cd6f:720a with SMTP id ffacd0b85a97d-477571cb959mr1787276f8f.1.1782902233176;
        Wed, 01 Jul 2026 03:37:13 -0700 (PDT)
Received: from [192.168.7.218] (88-127-185-231.subs.proxad.net. [88.127.185.231])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-4756636cf65sm16809808f8f.21.2026.07.01.03.37.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Jul 2026 03:37:12 -0700 (PDT)
MIME-Version: 1.0
Subject: Re: [PATCH v4 1/3] i3c: master: dw: Report actual GET CCC payload
 length on success
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
In-Reply-To: <b99393b7761ff249dfd147b5ac028ea2e48915ce.1782824628.git.tze.yee.ng@altera.com>
References: <cover.1782824628.git.tze.yee.ng@altera.com>
 <b99393b7761ff249dfd147b5ac028ea2e48915ce.1782824628.git.tze.yee.ng@altera.com>
Date: Wed, 01 Jul 2026 12:37:06 +0200
Message-Id: <178290222674.176638.15906284505119583670.b4-review@b4>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1294; i=amergnat@baylibre.com;
 h=from:subject:message-id; bh=y9sLn/8h42OZAovx8ZSCMJKzKeoA9vzessZn5NM7R5Q=;
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBqRO3W6RSUBwcwXd/RyICidNxc/zyGOAtYZuRyl
 Jsj9dvEae+JAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCakTt1gAKCRArRkmdfjHU
 RdLnD/0UpCa/Q2wq8xsbII/YaP0tNZvNatp03fchDuKWWea8QwXe4UgAYdPUJzOEXalslJ+gz2T
 xpK6CSQpwG0n4IVyfWbC5dHltlVJuN0jlXQ2+EEMB7WxEABr/6tjEAgnz68RT4+ql6Wp7EA+x1I
 zupfBdmaY6w+HeU2L7gUDYhlCAHyPrzDsimOa9gtU3lCxGHMJGCbYLWEA/kHZ8PfqTQX5yeqkHD
 5WF69+VTf9xhaG9V4MN8c9efCN40CbR4/Ed7yLJrvDm/HwypMkGHEH9teOjuYkUxumxzZ7RjTzZ
 92pfbXQLs4u0q2F7/K2VObkGp4HH40MOjDFWuaOeJOrXm6MnIgD8xzW0bMyL1q9uYylEE58XV/j
 xxqbfI9zYJXQmIfnTdt1VTU2oGc8ezPAw28FHw3dxqcv3nPb1hQFRKIuCZDdZi+ZQ3CNw86A9YK
 eLjzg3B3X/rR3dOrv9qLZBH2v1tIHkZCCOYb356m/S5aiY1x2DukKk5BIpGNWNmIqGWZ4x07urC
 KsNz8b0WWLn7gub/jYg+HGajgAqMDYKc7USKG/bbHS39pvVD2ocrYVjoHTptjFYzD6bjpGXFowF
 CF3LmjPogUsr9von4hwTxXm9gcMAYLn5RQ0oUkYx3KAgAyf21vFnifOIaqImi5UswX5GSajCeTa
 VfmY+utVzZ8xj7g==
X-Developer-Key: i=amergnat@baylibre.com; a=openpgp;
 fpr=231B5ED7F3EAAA700E60FE8B2B46499D7E31D445
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260701_033716_069897_6762A277 
X-CRM114-Status: GOOD (  13.87  )
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

On Tue, 30 Jun 2026 06:20:25 -0700, tze.yee.ng@altera.com <tze.yee.ng@altera.com> wrote:
> diff --git a/drivers/i3c/master/dw-i3c-master.c b/drivers/i3c/master/dw-i3c-master.c
> index a7593d6efac5..4a984a5be264 100644
> --- a/drivers/i3c/master/dw-i3c-master.c
> +++ b/drivers/i3c/master/dw-i3c-master.c
> @@ -742,7 +742,10 @@ static int dw_i3c_ccc_set(struct dw_i3c_master *master,
>  		dw_i3c_master_dequeue_xfer(master, xfer);
>  
>  	ret = xfer->ret;
> -	if (xfer->cmds[0].error == RESPONSE_ERROR_IBA_NACK)
> +	cmd = &xfer->cmds[0];
> +	if (!ret)
> +		ccc->dests[0].payload.actual_len = cmd->rx_len;

In v3 this assignment lived in dw_i3c_ccc_get(); in v4 it has moved into
dw_i3c_ccc_set(), the write (SET) path. GET CCCs are dispatched to
dw_i3c_ccc_get() (dw_i3c_master_send_ccc_cmd() calls dw_i3c_ccc_get()
when ccc->rnw is set), so as it stands actual_len is only written for
writes - where cmd->rx_len is the count of un-sent bytes, normally 0 -
and stays 0 for the GET CCCs this commit targets (patch 2 later moves it
back into dw_i3c_ccc_get()). Was there a reason for moving it in v4?
As-is it reads like a regression; keeping it in dw_i3c_ccc_get() would
make the patch match its title and work on its own.

-- 
Alexandre Mergnat <amergnat@baylibre.com>

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
