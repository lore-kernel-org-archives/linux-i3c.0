Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2DCBAC43602
	for <linux-i3c@archiver.kernel.org>; Wed,  8 Jul 2026 14:52:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:References:In-Reply-To:
	Cc:To:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xpDx9P6QElGj3Cb8dXX6RkmCQ9Wj1SBmHeNc9A3PRVU=; b=2stK5WSQrubln9
	KODYZqE5YcJKaQ3DA30KBeVmtju/MZXg2pbA2Kmpa9cf14JAtfrDLlKctm6oBOQlbCE7UlWH4T+0Y
	26hLJCccT/jIvWlqxiWqLYHErE4ZRANivPksk/AZjwliAhLeIRQQ+GjpOBV04cAiYa1eShsCeJo3I
	1avENOTSIC3bhsyNx/tZafK53c048upMpwaUxlSE2uzeK+ayD2fSq11rW+SRDbu4Wz88c+4fpjbKH
	uyjb77Pmc1PNpkR9F6EdabjQwRhw06KYcOGgn7RVZbZQFwz5nWAwkg7L7mBiyUB547GEddVLCIY3o
	1k2LMXWybyAdJSH/r64A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whTde-0000000HOvc-3rJz;
	Wed, 08 Jul 2026 14:52:38 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whTdd-0000000HOuD-0Pgz
	for linux-i3c@lists.infradead.org;
	Wed, 08 Jul 2026 14:52:37 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-493c733f15aso6848815e9.0
        for <linux-i3c@lists.infradead.org>; Wed, 08 Jul 2026 07:52:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1783522355; x=1784127155; darn=lists.infradead.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=WtG/3aGhNl95hDYaYcCOha2vB+cS3A8UgbqMAykU0ZM=;
        b=TBn83a5rUkGCe6VEJEatbrT1/LYlVet6blmauEjg3uXHBHE2bIzpO7ZlQ8TL1Hedax
         DBW3oi0B78jVrPMebgM5IrJkfhe2ZvpmdYHT/Rz3QWfdNFpkakcoIF9owa13KKuLhKvR
         wnkzkcIcvid2uGqb0JH3IYi6i9ZIrJ4i9IbICUHqKHNpX8nGFzFzlAePBFkI38ZyyIKV
         CLzhsedFcpkl0cK292yCmiaFw/u9c3I6Mrp0cIqTwwA8n7mihGv8CobLf7Rdo7CW2+hf
         ZljXFAKuMxYiqR2kMQqgasqYOvGU/qPdPjOF+jcAyoM80aqlS92WUrrPqNgdZz2Iaan7
         omBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783522355; x=1784127155;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WtG/3aGhNl95hDYaYcCOha2vB+cS3A8UgbqMAykU0ZM=;
        b=V5hPF4clikGA/Io/Gq7cu5TpSvgs0wTV5b27LZUzHPKBkIN17sDyhBWKLkaaP2jP9Y
         UZSMNZ38S5e5XH3iytXEVYrW7PYEw7ezjJMb+SbT8zYHFTvvy8hewlkTiBAjsU+93AeR
         8bQNXlcOfk9DonnXa0Umw9ZhLhK3W1zAU9Qq37WZA6u+wbq1cWwm96nIbPRwylonMAqN
         3aYK1Vwpt/9MYYVA6eSnf5ep0lZjynE3DWy82bNwus6TrYFAhQJ+XvsDDs1HKESBNby9
         8VBVALPT4egSkbKMOoQCKSSQ5LmqehSgFA3lDZ3gMb+dKvggAjWW5lz8f0wyFc2hOEPk
         2+3A==
X-Forwarded-Encrypted: i=1; AHgh+RpVYJFA9aJBa8/TGo0dAXhNZsWVc02pV/VwmSvHwSAaRiIwuW7p3uKC2y8lYSaqlBxeE3rrHuVInEc=@lists.infradead.org
X-Gm-Message-State: AOJu0YyeCf6uKM2az9ZJKexy1qOyL5uaSrhfHzGF0/OjuIZ49Ovfu/Hg
	hutq82INc+VMs/26ftmoHmcRosH8wQA6+ibZ8Geq3HvetKvjRknr93wIlKh5VZeMkhY=
X-Gm-Gg: AfdE7clnO8TSXgtelIpNbS+1V0xgYYv1GfFIorR2hwB6l+X7eL0LiDvv6Bu2ME4N0RV
	GhnfQJhjstxGZ/tuAlisdkfDqogXgNV/Ztgs3RP/iDV6iVShDktTIqy33LPBnknHjZ5wz9Fc3J/
	CqvWgWE3iBouaFgTdD8ZnSovHU/So8SY6WrLTHRy9IykNtu9c7lshUgdwd06+tmen0mPRRV4iBn
	2Gp2tAEviL9iJtt1Bp7m5oyzGqINFIeqOgaVlRgZR1YCG4ZsUXVF6yKZW3le4cREKhg1opsVnZT
	0z8/JtBzRgCpPxqWUMgSgxBEs2V/zsiBPmgaJWI0aJ4MP3QL4HhBdRsVTSnQi3aYKQgd16sO2xu
	3/UWfitGDUGRQeRfcJWP6okYpYGa3Ue5EagLjZCSbH+7qoJIonx01uVZ/X5yw2xm9AfM6Sj1udR
	lPnvSKlgXoZ47ox0j0p88Pyeb6HiT7iFfr8cFODn35IehQBFyGcP5Z
X-Received: by 2002:a05:600d:8496:10b0:493:ad1b:b38d with SMTP id 5b1f17b1804b1-493e68ef1bcmr22810655e9.37.1783522355279;
        Wed, 08 Jul 2026 07:52:35 -0700 (PDT)
Received: from [192.168.7.218] (88-127-185-231.subs.proxad.net. [88.127.185.231])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-493e0fbb410sm147686695e9.12.2026.07.08.07.52.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 07:52:34 -0700 (PDT)
MIME-Version: 1.0
Subject: Re: [PATCH v6 2/5] i3c: master: Report actual GET CCC payload
 length on success
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
In-Reply-To: <6c66571ae7166aa4b87616d900e6d643631ac355.1783493868.git.tze.yee.ng@altera.com>
References: <cover.1783493867.git.tze.yee.ng@altera.com>
 <6c66571ae7166aa4b87616d900e6d643631ac355.1783493868.git.tze.yee.ng@altera.com>
Date: Wed, 08 Jul 2026 16:52:26 +0200
Message-Id: <178352234642.1152337.590208523920132503.b4-review@b4>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=454; i=amergnat@baylibre.com;
 h=from:subject:message-id; bh=6zw6s0CTUaTnsBUWyMIQn5jdniJ3Uw5VK2cUDuuWjfk=;
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBqTmQuTCnP8OXYLKhboPk6Bl8nbFgpA/6RLfuKS
 tt5ICq2sy6JAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCak5kLgAKCRArRkmdfjHU
 RT1DD/9snuCIVJwmkX0+pQPjtzsR+oWk69wMjJFQo0woOwVq97mTPmBA7toL30HCe8eGpBJZUFd
 wOPEKLsqdjD1KK6DeyUMAPPXqgsQSh5NEUy402ECdc8meshXzUxxu/KQg1vxqgVWdXS88lc9aCx
 O4zKMkldNrJfgTHYaDtZ7XAY4LKy/6/22qJPUYwLWIjWrIuuvg74Wfu/1Obc8r+QPU0ScAGGTeS
 h74ETP2VELs7uxm4tcp/Da7nWuG0J+wJmG5HWiwJEF3AgModpFWXUx6+3Zq4UBlY9uXDycaJ7ZA
 lLL2wVPAggIxHhwYUh+gfKUatmovTu7IlC849OFwh30Gz6k7OHGehUmvqqK9/ScjOaQON2QwbEa
 WA7lUF6h29nUYyDGNitDqxP06Xetm5cInKalya1vFTCY6JcXv8kEuo0vBb7S6hefEJhMM6smtYJ
 GfSuZu2QlWJ3cGUTkZgRkWm8C07zf+vPhvQ7VIQ6ipfK5E4qFZ6fygWvCV+3Ph+wywh7nBpW+ex
 eZRgQ0Aem4tAUC25+9TRVrMl4B68/BZnTHpSDhk1qAf3H8whGYyWptWB+AKFXtWlzK4Qmtxh8Ax
 Y8wZVy3Tc+ADJ37vaar07z8KQ34wEHSD+PNv3UX3FTOvYu6An9D+48bhrA5b8HOYqcIwBgCMpqx
 hxVWbKSM7uW88IQ==
X-Developer-Key: i=amergnat@baylibre.com; a=openpgp;
 fpr=231B5ED7F3EAAA700E60FE8B2B46499D7E31D445
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260708_075237_166486_FFF9383E 
X-CRM114-Status: UNSURE (   6.84  )
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

On Wed, 08 Jul 2026 00:17:38 -0700, tze.yee.ng@altera.com <tze.yee.ng@altera.com> wrote:
> Set dests[].payload.actual_len on successful GET CCC transfers in I3C
> master drivers so the core can distinguish requested and received
> buffer lengths. Switch core GET helpers to use actual_len instead of
> len when interpreting GET CCC results.

Reviewed-by: Alexandre Mergnat <amergnat@baylibre.com>

-- 
Alexandre Mergnat <amergnat@baylibre.com>

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
