Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B25EC88E75
	for <linux-i3c@archiver.kernel.org>; Mon, 14 Sep 2026 23:47:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+pkzRR6XuuXbJaQVlCEuPPaHi1OvV2IFJ7DyLaANiME=; b=x2YJ68wC1kd/P4
	EMsOetb4BhrtbUHtNzpr3dVws/lATB2QnDwaegMKjp4JYk8TPf77soy+WRkxb+vACBKVWp3PmO5e2
	hcYrvoa9+S2PR0ALOu3kp/nK9ZiZrGvG85gvYg97OVkoavCX/U7BufZpOns5dSpa8URkDy8PQI1qd
	Aqz1qNClCdF2GiDl/5BLwpZpe8xnoU+9c8Ly1Ul9vPxuLH3ZADMSlmO+jDqG6n6vf8nJOtWAUYpwa
	jMhbeqrR1LLzwBGonNYk5pW3kK6BlDpIkjfoUmPz2rp42AyveofGgBV9uZUlcVqnkkM3j5s8Wl42T
	9iZEqZf3aW3/Z7KJhLgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6GOJ-00000004seX-3ihG;
	Mon, 14 Sep 2026 23:47:15 +0000
Received: from mail-yx2-x10.google.com ([2607:f8b0:4864:41::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6GOH-00000004se7-092R
	for linux-i3c@lists.infradead.org;
	Mon, 14 Sep 2026 23:47:14 +0000
Received: by mail-yx2-x10.google.com with SMTP id 00721157ae682-85d43da99e9so21669807b3.0
        for <linux-i3c@lists.infradead.org>; Mon, 14 Sep 2026 16:47:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789429631; cv=none;
        d=google.com; s=arc-20260327;
        b=cwTamE1n2ina4HPlN/9Kx91Q+bPh9XJOwsff+SjeM+0e7ANsA86p4ThsuTgC1qplnm
         xtAuR/RcGG+THI9f/C4lgIJIEaQMu3BswtudZev4HpPWOgfSz2tyO7hFPTan/cD3Kwp9
         6hyNHxvto4pYaMSz/COq10ZO9FuhPaI4qZj7y8ysQdAomV4C5K9Hc/GIwN1qG89AuAZf
         HHwLajzryHJga9Cl+kQw29vXTDpmFkX+V4z2mNF6f1XBbl56zsOcn4d0yKPJxdYH+9Ya
         1/E2tBOiwTIN1lDRSZMygO2yOLQkK7hRX5ZM2hhX7auJFMZMj3zhOluM+6AZy4u3hyvB
         j3Nw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=cFthcrFYFgZKOOCNtEyPVxbnm0K5sPNXxafO3124q6U=;
        fh=ku+2FUcBp0raw8cWKNjB08gra+D0fmF3XZfhIal/3J4=;
        b=p7jT4Hi1EExaRMa/ilrBM6yaI0tNM3ZooAgfrr083bvPU15oQRrM0SVyFrgy5rjdU8
         3LU79xV4ccESNBRtgmsSYZjnGTMiys+SzLrXftTxT3/9NOyh7NE7ynGFBAIyEyJBpOSM
         ImpgHaqO+Siu4wCOFUeb2onwnL7n4jMAri3TYC8iAA38fz0bOinqTXnwyEi4+RX/Kaa2
         0RZld+lABEPepcEnoTqsT2ijmepm4pAnel4mEsBV9Kw6GQKt7dyn3aJewEGmtuJOVSTU
         02yVRPQtvcF7FGWsLYCypfsr6Yf9GCKoyxdg5NFwL3krOvFtOrSBtq4PLAa+aY41BWwi
         CG8Q==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1789429631; x=1790034431; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cFthcrFYFgZKOOCNtEyPVxbnm0K5sPNXxafO3124q6U=;
        b=pEigoZDofvSDIEvqfheoef83ac3HdD+yfgWtQ5wiPqhbjUDCrwKg68L9GF14fY45Fj
         +vz+DVmsvK2ioszGolKCnXQVkgf9Es9HtG5Dl0QiXLEwGYZNeBd9ceeDvASSEf7fDlEr
         QzgeNXD7l0SdZkhBnez3fLOQH7k6NgPZxl0jaOexW2nOr+KCegtS14LZcJULjwq7h/mk
         2zmpl83SJqYep+1wEDBMIprFGeievzPiKEniIGWGDO0ag36qyMKxeW/MNvYZPw4o98fR
         0xrfdsjtwaggN98bp6+TGEpSWNrkzMvVlD54Xn+p3OFRb0z6eG5OiImPiqartYWg4P5n
         p6dQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789429631; x=1790034431;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=cFthcrFYFgZKOOCNtEyPVxbnm0K5sPNXxafO3124q6U=;
        b=Lhu9Tybm+y7gPTCNwO+Lu3V/IxSDFmboHSGCS5aw3OxdFeaOsqNYynqCkozP/DSfqk
         0KPsDI52/79BNijuzAjwe/3TN1DVnf6HQfjmdOZ9UKt+ia+46U3MCMk1187j7DZlUQbE
         X60qvvGTXTr9+hC8tnwiSI5uWx9n8lydnIhTWclSeSxBqjLcqEUfem60Yn2c4VKqDisN
         v2YqPvmWYuRemIWEgzdcIH/trLqQeJlBNzFwU8YztLxg4dCe5PpWvoFmw2bjuoM/5Mjy
         YBikMN8Yn+CIZCvHd7iOYkjUNSuyyngrejHMj1d1p8Hykq81BJ5CDnVrBNALa+P0ybsm
         cYkg==
X-Forwarded-Encrypted: i=1; AKwUvBx4MP2RJ7ygjAojQaaL7MAw11xavRJrmzb6LKmKD79JOErHzwGoktnIacO7Q0hacaadANAAQzvVb0Q=@lists.infradead.org
X-Gm-Message-State: AFuF++ljNHOtpAc/CTU6IQ9rv9e4EeyqMoukNH8pqG/eZ+eVIMgOFn0o
	tyIDskA2l2iWFxKWCdEj0kZNAuT+iGRan7kxEoSlY7oqW49Wzt5pYzuAOCJD/gElbuMTD10LLnC
	yo4IIrArQ+It3cPSBm4vs23Opy7Mm5+0EwG0Sd3Eh
X-Gm-Gg: AYBFou3qsqP/UEDRA1Fg1m/+Pqh5akrh+TQy12ajnVq6eTvuloX5Hpk506hh//b+beW
	0qHP6sxlMnN4hLd2XDU5D+txWXc1ArU3cvwHKspGueSfC3Ym9SUAGG41z+A/6OQjZVpYpW0WsgX
	yeLKkyHjJwAXD4fDqvqzIg3h0kxMuENud8NRBaJsGBhlC8Xo0FgbdWUC8pZvtLhv0rAQV1rQlKs
	kie/rK9k41TUdueuQzJcbm6Nhf/MZrQBjkXVs7UUr8/XRLeANzOIwW7/E57mmShQKtvDhL/im8U
	+ZNiMY9G+xD/rdrb5HlKGhx4N2Jwh1SYLy3lkJMLQ1jHM1Sbdt8hUrKe82j+hfBS9F5i88r32Ju
	pY2DVG30JYA==
X-Received: by 2002:a05:690c:4f85:b0:873:5bd1:98ce with SMTP id
 00721157ae682-88d246564bemr11903357b3.64.1789429631046; Mon, 14 Sep 2026
 16:47:11 -0700 (PDT)
MIME-Version: 1.0
References: <20260906202747.4041389-1-samagazaryan@google.com>
 <20260906202747.4041389-4-samagazaryan@google.com> <aqHU-6RV_AapSu3M@lizhi-Precision-Tower-5810>
 <DLC6ERLST1B6.6K3HLH38DQLK@google.com> <5fb77c2c-40b8-4dfe-95d3-e0c73b8559bc@intel.com>
In-Reply-To: <5fb77c2c-40b8-4dfe-95d3-e0c73b8559bc@intel.com>
From: Sam Agazaryan <samagazaryan@google.com>
Date: Mon, 14 Sep 2026 16:46:59 -0700
X-Gm-Features: AcwNN1V-uXXao4kvW2-FUblLASgfbHJF_w7kOEKYfus9MUe94SpKIUhs3nxCeVQ
Message-ID: <CAHreonHEAPrzhVH0AiAzrZOr+h8D=T8hB_oC0TP50d79y_OWSA@mail.gmail.com>
Subject: Re: [PATCH v4 3/3] i3c: add i3cdev module to expose i3c dev in /dev
To: Adrian Hunter <adrian.hunter@intel.com>
Cc: Frank Li <Frank.li@oss.nxp.com>, linux-i3c@lists.infradead.org, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Frank Li <Frank.Li@nxp.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Arnd Bergmann <arnd@arndb.de>, 
	Vitor Soares <vitor.soares@toradex.com>, 
	Oleksandr Shulzhenko <oleksandr.shulzhenko.viktorovych@intel.com>, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260914_164713_138228_FDD6DBF9 
X-CRM114-Status: GOOD (  13.47  )
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

> actual_len is a problem.  Only 2 controller drivers support it.
> No I3C device drivers support it.  mctp-i3c reads len not actual_len.
> regmap-i3c ignores len and actual_len.  And its definition comment
> is not exactly correct since it is only valid for reads.
>
> Despite that, the additional issue here, is what to do about a short
> read.  Seems like it should be in the uapi, but actual_len needs to
> be fixed first.

I think something we can do to get around this is to incorporate one
of Meagan's patches
[1] which addresses actual_len usage in all the controller drivers.

With controller support we can add a field for actual_len in the UAPI struct:

    struct i3c_ioc_xfer {
        __u64 data;
        __u16 len;
        __u16 actual_len;
        union {
            __u8 rnw;
            __u8 cmd;
        };
        __u8 mode;
        __u8 pad[2];
    };

As a follow up, I can also help clean up other i3c drivers in future
changes, such as mctp-i3c
since at that point we should have actual_len support across all the
controller drivers.

Thanks,
Sam

[1] https://lore.kernel.org/r/20260911210935.1353126-3-meaganlloyd@linux.microsoft.com

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
