Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47465C43458
	for <linux-i3c@archiver.kernel.org>; Wed,  1 Jul 2026 10:37:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:References:In-Reply-To:
	Cc:To:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dUSgFdupCNnH6+t+AeuD0BK892ma9Nw2XeXsArFmeQI=; b=CCF3YvbSfOnThA
	4A60J2Bxh5orH9ewwyN1YRhRq5glQDEp9jikBul4d+6Us6j0dVAYPkzN0ls2Y8dDtXXmdIlW3vqaN
	6ooJcNGPYMsDRKOklHdftbfo3oWetlhpwmF9zEUg4S+kC8fO17ja9Ltg7PCQR96/mrXBboTAGDCGh
	7Nnsboji0rAWYGrz41oy66ac4yHsJ4ibiPzi3/uNUTPt7MBOde4PN9CldOdc4Nh/ehc9wQAvHc1FF
	cEwk6hpo8/2LaM5nZ4SYMJy1KqOzgaSnE6dXVCkcCbORTbcnLbNQ19uCZgPmEUy09zDwVvRFqVUmA
	DHd9IyoO5fNVRRx40rDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wesJn-00000001KDL-07vx;
	Wed, 01 Jul 2026 10:37:23 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wesJl-00000001KCU-2Cko
	for linux-i3c@bombadil.infradead.org;
	Wed, 01 Jul 2026 10:37:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Message-Id:Date:References:In-Reply-To
	:Cc:To:From:Subject:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=ia0QoIcPsX3jjdqrBe5j4cttXq40HPCXDLOJo63Nuzk=; b=FYC+ZNrwu3BSpwfh5XJ30G9rYr
	wrwdQ9+jBdV47VFsD2uXOYpPbFPLT+A8/tKMzME4ZxOHDYe1dRCYWH4ks6DASOHmQJx2YXvoWYi8L
	CzVZkaot3QTNLZHezC5eqw8Q1OaAGwFtgJHdf/Rj2YEVxoLa+FIq5fQbBCqPmANzE/02ikSdezVIz
	qTTXny6TyCNa0O4saHhP0RcXALaZvYlhJRsIf537dMWiSfKDPQMISYEkvp8fwTu1B0xrS0KMCvd2T
	mQFNan+78rRo/QaYVSshZO5eoELMHRFgh8kEL4f3ybHHdCoyYgawoeNyVIKaaXQ5gywn7IJ3bKhGE
	Imd1YaOw==;
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wesJi-00000002d2I-2HBk
	for linux-i3c@lists.infradead.org;
	Wed, 01 Jul 2026 10:37:20 +0000
Received: by mail-wr1-x42f.google.com with SMTP id ffacd0b85a97d-474bf35cccdso140682f8f.1
        for <linux-i3c@lists.infradead.org>; Wed, 01 Jul 2026 03:37:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1782902236; x=1783507036; darn=lists.infradead.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ia0QoIcPsX3jjdqrBe5j4cttXq40HPCXDLOJo63Nuzk=;
        b=Gz0jflURzxrGugJtfj04ewinfypSX1CiztE1DlRFBQQOUpTb5uxm5SdZ6mBXaMedzz
         fnppmlJjVhBOeupIjAVE6HvhpBCvVd+drACktrotNMq/vUuiHlVTe4hJuMMAMFqz2qjz
         vInfh6dtuxxsi8+VuF7Nyl4wWYQ5IwLqd5OdUsgvs2P6d68IzIlKBNug9FOfHlj5ukUL
         IT5HuhjYv/BY6aSE2ECIlvW4fRiwEQTbKvthFWbyDH8iYN8i81BWe00v5J5v2PBGbbY4
         9xDJ+Yhw6r8jNNBvnam48vvJ7Dx/fTq+iCMq5HVXzgH5o9HavkvEzf8hboyIKmpeSFdo
         17VQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782902236; x=1783507036;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ia0QoIcPsX3jjdqrBe5j4cttXq40HPCXDLOJo63Nuzk=;
        b=NyLectNJfkaifhfqBj6DDHmXSrAPP8sdO7kWizC/skTVYEZGtQLcLRG+MB3QWAveiR
         iNIsQoqLCYAb1xmCGhPMY0JArWWb604pYog2O3BIoMWzPnVvLE0hT1fdb/HQ6rCy2mFs
         up1oLyUglyg+huWjDqwvWK+yAJylLKalymhJea+N03wXgcDoGc6ZRWr32AZN/zMQ4xJs
         8EPCATJNnFGiNlH7PMNKUJz26bXQYbtaSYpFaMzHUwj6fVeZMeyuWTbvdPOthYTMdmsk
         w5gOHJOD0l5cIGFL1NU6oFC7KgzDxqLbpIyFOLnblVfX94fl5hxZcnItNO6VrQL+ylhq
         xnHg==
X-Forwarded-Encrypted: i=1; AHgh+Rp3kRZWME1Y0gcbnGVCrwHZiqD4KqI/dl64hhRPvY/Rosf4GTbxUMm+DNLy9P1BV2wlL/JoDXoFCpE=@lists.infradead.org
X-Gm-Message-State: AOJu0YzFx+TAHn9opdqu9wyivglV/ligIbPiYfzKZWXPMKG29wdicDw3
	F7WidmEHcGDMerKGw8CUqajlCeaBryjgBgxQ/eDBOpPjpUxBgWX0c7uWKkrqjZpR9Do=
X-Gm-Gg: AfdE7cnim64mmJDBHRpzLLk3lO9V4Po/sUxikBYLvhIzo/ozm59BL7DbEn9ay3AKWTq
	CM3w+vvhs+EIQ4ab6E/KM9yFClNjrGRPVn7JZVaJfC7oyr4R+NJdj9ZUfl/rSOPv2XTSunS0GtQ
	5bpmc+n0BBgMmTKIQGcsl34He0xZ7Z36GKOT9ashDQF9wh4yXEsjXZMwjeg/Fhq7XtSz1teC5Sr
	/DTTkFWNG6aojdqcVTtgkNmRzXXaAODHFlpPC0PueHLuscIEkstI+Rt1x2JzD5dWnn544zLoqFx
	Pi82XCZUCvX7aAa10Vciko9bg9/2U1XmuLcOBkfo+V3GXM90UJGjM6gnOoDn7yqrD2GLjSxdE1L
	Hp+PAOGTZIEmMgA1iwN8NjbYZz/HFA4E6oRGZCAqvo2tY/XJXzolnr1yAfYozfwC223YkTlXvZy
	6dilR2YI9ddLgu4osuCG976DCgVVPxPvJ8ZzNX+1KFos90eY0J9eGt
X-Received: by 2002:a05:6000:46c3:b0:473:8f65:c978 with SMTP id ffacd0b85a97d-47759d1ace9mr1334239f8f.1.1782902236000;
        Wed, 01 Jul 2026 03:37:16 -0700 (PDT)
Received: from [192.168.7.218] (88-127-185-231.subs.proxad.net. [88.127.185.231])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-4756636cf65sm16809808f8f.21.2026.07.01.03.37.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Jul 2026 03:37:15 -0700 (PDT)
MIME-Version: 1.0
Subject: Re: [PATCH v4 3/3] i3c: master: Validate GET CCC payload length
 and retry Direct GET once
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
In-Reply-To: <1bc55d123df33e2e66ad58ccbc17ba20f74999fe.1782824628.git.tze.yee.ng@altera.com>
References: <cover.1782824628.git.tze.yee.ng@altera.com>
 <1bc55d123df33e2e66ad58ccbc17ba20f74999fe.1782824628.git.tze.yee.ng@altera.com>
Date: Wed, 01 Jul 2026 12:37:06 +0200
Message-Id: <178290222676.176638.8647414585139967730.b4-review@b4>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1566; i=amergnat@baylibre.com;
 h=from:subject:message-id; bh=HrnbgRNyzxFOIFM7kdM8h/tAHYI/D1p5ateca3yYyzU=;
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBqRO3WXWXkpwZZzL3oCM2mfU1wuBHJmnN7dFTj/
 BMAtecl+z+JAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCakTt1gAKCRArRkmdfjHU
 Rf6vD/sHG6AtPqTggR8ibu9c/YMNe+chL12sKo1GGngu15jwf9pqN3Yw1AXHQO2G30oyaUC/rb/
 YYJzfnCmHzzNBFW7YuJhFVl2W/AR5ARpLD+8LlL++4wGX0terWG7sKDnJr1GKVB6kZFyn4M7USw
 XATE3On9IUcfIUFxIX6jdiBNWF/sQxOTe9djcU7dexacuwixPjYT/fkrdExTV/vgJA8EC7HzyhR
 EhAJNnYt3/mwsjz6hVd8purK7xnFUnm7CBDwh6ybNkH1zEGEOUpNm8dN7MOFdORi9kPMrZinKiF
 J44pSi2s1yOOjoCizGaLEsv9FJ36KgbF/tNEGXitq4U3hPvdh4u2HLiKnPrvoYJ0Ajwdhmuz/Uf
 JuMOkNUB8K6XTTa/fVjP55FsNoVvPrDND0voKrIBsBddxj9GkgtnUQboNFEnSs/w2oGMmzgAufk
 cSvF8XmxQucFwmlIC9HsVSR7pYLrWoEbHtQ3fSU71HRNp+0zDUsYU8xSqKaZ5Q2Gc9VrHjWv7Hc
 7gBE40zmhZ0TrZerGFfCa/puvvamNZT9JqmWiuQVD9bOSYuSy+Z4gjxn+gDUsiLI8UfVGrQXimH
 nrMr37VJ1mzNSsc13zpKCZsrTiaO7LcqOyAO9iBHeCHgPFstQFzVQfFfunPA2s4O4Z0Cl4u1fSi
 V5cnWLF0XJob/Iw==
X-Developer-Key: i=amergnat@baylibre.com; a=openpgp;
 fpr=231B5ED7F3EAAA700E60FE8B2B46499D7E31D445
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260701_113718_649635_E91EE5D0 
X-CRM114-Status: GOOD (  13.78  )
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

On Tue, 30 Jun 2026 06:20:27 -0700, tze.yee.ng@altera.com <tze.yee.ng@altera.com> wrote:
> diff --git a/drivers/i3c/master.c b/drivers/i3c/master.c
> index 6b8df8089a35..3ad8a232340e 100644
> --- a/drivers/i3c/master.c
> +++ b/drivers/i3c/master.c
> @@ -914,17 +916,55 @@ static void i3c_ccc_cmd_dest_cleanup(struct i3c_ccc_cmd_dest *dest)
> [ ... skip 44 lines ... ]
> +			continue;
> +
> +		min_len = p->len - p->optional_bytes;
> +		if (p->actual_len < min_len ||
> +		    (!p->optional_bytes && p->actual_len != p->len))
> +			return -EIO;

Unless I'm misreading, the second condition looks already covered by the
checks above: when optional_bytes == 0, min_len == len, so
`actual_len < min_len` rejects anything below len while the earlier
`actual_len > len` check rejects anything above, leaving only
actual_len == len. Could `(!p->optional_bytes && p->actual_len != p->len)`
be dropped to simplify? Not a correctness concern.

> @@ -1371,19 +1437,21 @@ static int i3c_master_getmxds_locked(struct i3c_master_controller *master,
>  		 * while expecting shorter length from this CCC command.
>  		 */
>  		dest.payload.len -= 3;

Now that optional_bytes = 3 lets a 2-byte GETMXDS response pass
i3c_ccc_validate_payload_len() directly, this fallback only triggers
when the controller/device returns an error on the longer (5-byte)
request rather than a short read. Is that the intended remaining case? A
one-line note here would help; otherwise the fallback may now be
redundant.

-- 
Alexandre Mergnat <amergnat@baylibre.com>

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
