Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A408C43458
	for <linux-i3c@archiver.kernel.org>; Wed,  8 Jul 2026 14:52:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:References:In-Reply-To:
	Cc:To:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+5nnVx2spfqqSaTeCnQU2dq29bR1YrVMBkxIhdVMT7U=; b=DI7KG4RO4Ls0Pc
	3/Uzzpo03IcMVslI7vUsPIwsukVTozX7fe96zOUEn5OpOt1JR2EuzdMkmit1tN2iXtVvW29bPnI5I
	VF0AMzdP3SxJw00eriCYP/ese3/lRsUvg8e1325GXOVEc4AwIPXMBQUSs+t8flXGTbepo/a3ZZ0S1
	QzKK60J9Xy9MtSWXV8ZEKFlGzhgY8jaxfjM99/iglqqOUU8SvMgJi4tORw6pk7jpZF03uszRywKfi
	VW2vghGlDl4rfM8i6qDUJGZEK4G/RgzrL+vPL9nDUNOIvIDRSs2flgm/TpVDJe1CzkA9BsstnXR35
	dDQRrk8lj3Bxi2IGnozA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whTde-0000000HOvY-3cbj;
	Wed, 08 Jul 2026 14:52:38 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whTdc-0000000HOu0-0WEy
	for linux-i3c@lists.infradead.org;
	Wed, 08 Jul 2026 14:52:37 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-493c1950518so12521215e9.1
        for <linux-i3c@lists.infradead.org>; Wed, 08 Jul 2026 07:52:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1783522354; x=1784127154; darn=lists.infradead.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=+uyqxi4gyShbRBrMekCyTgM9cOpxEl85gHVXZJsiZ60=;
        b=BFvkZMpXKrVuhmLqGRBt+h6jbif2leX20x5C17UYGXUJGgtoBeT66YK9LqxVwENlGQ
         z3De3aY7vY3X6q+sL+NbDCCn27JX5XW583oE3JJBdVMNM6yPmmkJtziOONVYIRXFnlz1
         wYWPTnBFUNTsyKgda5iAcOP5EZLrhY3ky0YBDJMhnJhKCOJoncbOzCL1Zk//ygzl0sS7
         xohjfwu0EHwQ1VVl6P5V4KfHyqiQKGZGDb7TJyxLJb9aCieswLm1IHhzO/9qdyahwnvp
         KX2pPs25vlq+tRUsAvAe6vw0uaXkAJZKWW4GAWECGg2/4cpZY/GX6tqGA8FCb3nWFJl6
         D41g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783522354; x=1784127154;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+uyqxi4gyShbRBrMekCyTgM9cOpxEl85gHVXZJsiZ60=;
        b=sfK7H0xfTBJjnm2KJEJ9nAZ2wcIg4rquADEvmLEM8EAI5qDiwJUlAhvCbsg0Nx7hWd
         JcIuXcwlIxQvSqp7jYffOEaYvs07Tm5I8xYyYsxkKwf4xnJjv7fzBKKxdItjYiZXZFVo
         rVbKeHU2AXKy4rEl29o8csiiAAJv2LEyXOiXZYdFM3OlsrTOhCaejgdmGFM3cO8FkJMQ
         xtyJYaI17KIGp8qwQVRZqo14UBEKACWXriNBpziO5yPyP0QtcCmxTAPdX+BouqcPqD+F
         b4CMisyd3g/OkdwI6hdST5suqcz7iJNMyhAQ9oJcBRT0uSahjOJm5QnJNg5hpdds6wt9
         qHLA==
X-Forwarded-Encrypted: i=1; AHgh+Rp7wLLcbMI1eitNef+3YF6CgCrEjEMS+1Mp6VAoRDDf13U0ZS7k+oRGHC/Wpue5e5IVP6b+tBc6FHo=@lists.infradead.org
X-Gm-Message-State: AOJu0YwoHn27Pwo+1uAXUscijr3E2Q7qmYF6UNHAwXMiiDn/cXdR0S9o
	1Rsc+JZicK5J/rOp5jfCSXV+dmvUcYVhCZFEu+/DPEst3dBvv4cOeBbaVEhLZdVQ5pYxIydyf/4
	inxCGqA0=
X-Gm-Gg: AfdE7ckORyCXbeYXVQato7Bv7ZKGquruE9zrzzYEWlnoqLqt2II2SQrEXGUYJIy2ODo
	vBnNiYDLZnELBG8r/hgoj13mtaoQ09dIUqW8aAzT6RDc2hhKFSwBzLRRLdF5jBMGLllK2KiS+n5
	oIl0YaVszBBDj8WUROH1SNwqkV1RdLi127Taj7CIqqe1kxqPOyWN+uWeNZBtwUNKeku5kS5BGK5
	OZmRhk+MhjGcDoxzY8R02aS8SD/DXLQlbG/oKa/SmCuRbx8kbu1/tc25pzmABa+AHZOdYKXplP5
	47FbmbLQqS+Xb14lB77pWJlXtQq3rOd9IStjThlWBUD3/yeUSiUVZkTsphEQNA0BC2WiaUY2STd
	GcJyBOj48VDjFijDUEw/EsyRIuDTKkO6bCHdygHrxqsA6Rb/pdBQB2tNDzijiozBvdS6t/66D6q
	vYRvQkORPPijWe3vI2YybCjDzCEWgXfut7ta4/0YbKukiM33q6DSoA
X-Received: by 2002:a05:600c:1d04:b0:493:bc4a:a14d with SMTP id 5b1f17b1804b1-493e63a9f76mr29411555e9.19.1783522353790;
        Wed, 08 Jul 2026 07:52:33 -0700 (PDT)
Received: from [192.168.7.218] (88-127-185-231.subs.proxad.net. [88.127.185.231])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-493e0fbb410sm147686695e9.12.2026.07.08.07.52.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 07:52:32 -0700 (PDT)
MIME-Version: 1.0
Subject: Re: [PATCH v6 1/5] i3c: ccc: Add actual_len to struct
 i3c_ccc_cmd_payload
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
In-Reply-To: <e452777c3a9be734a97e20b9822d8a4264ceadba.1783493868.git.tze.yee.ng@altera.com>
References: <cover.1783493867.git.tze.yee.ng@altera.com>
 <e452777c3a9be734a97e20b9822d8a4264ceadba.1783493868.git.tze.yee.ng@altera.com>
Date: Wed, 08 Jul 2026 16:52:26 +0200
Message-Id: <178352234642.1152337.5683615281919618767.b4-review@b4>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=372; i=amergnat@baylibre.com;
 h=from:subject:message-id; bh=4CnOZL+iFIcbMNg4LvYJHj0DXJaNaYXRL4LHvyLzxr8=;
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBqTmQtX50W1xQQOMzW1DMxXVQUGOe5W6mRdXYtp
 0nUPbrEmjiJAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCak5kLQAKCRArRkmdfjHU
 RcagD/sEapgGNMXOHcySdHIXpZzv2lVWFyhjdWooE5GFNQ6QZnag3+6T+bKV+/UMMlyHWS5CVBk
 fPWtvFTvimSmLGufFA39BQsSzBFSpIcV854B+ONqq0LBooiLa348wqzcB64KQANOy2t9PJyVwgJ
 dqILtueqxDJACrWo6Nx/Rq8x7hbsqqY3NSn2O6R1LqbFJEi2DMSPYinEpyxdL0UrvxqoqPPkr0i
 cAMa7Td7mwP07hZLlSmaWAf7VMcX0j46ebPUV7GkQ/7rY61aKS3zBQhRowcEADIJ5EKak8EzZA5
 5Y5/Gov5k+tKPKe4I9/QzAw+Zz8kptf6AxGgjezxnTsEL4PGxG9rmxs0hLVYRev1Mk0hN6HajJl
 NwK/MJGbcOC0H/aqJO73hMvygmKkIjzfb7dPyfmpaOwHvouINiV6qUEE6lwqxS9PwmAANIxut3k
 Ke2TXRz9qxggO9Wy0iFj33i6c7LFmaAknTJ6yn9ruYZuMEpeXwvLi+QceGR0S7QMU5x5pbJ3SpB
 uQG0KCBCCNtJ8GTEeTIlF9rUPQ1pOVdymfeu1h5SvQP7XrqkpUNxbWamkXn1MPXcHPYi2g+rJ3M
 VsKP755IKvHHM3Yv3heekPO7cjr/QYt+gkFt++z0qaShpCOtdbxnFGOqvajN3yrLGlJX0zN69fY
 VSSrFz2odKPrviQ==
X-Developer-Key: i=amergnat@baylibre.com; a=openpgp;
 fpr=231B5ED7F3EAAA700E60FE8B2B46499D7E31D445
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260708_075236_186377_0527A12A 
X-CRM114-Status: UNSURE (   6.50  )
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

On Wed, 08 Jul 2026 00:17:37 -0700, tze.yee.ng@altera.com <tze.yee.ng@altera.com> wrote:
> Add actual_len to struct i3c_ccc_cmd_payload so drivers can report how
> many bytes were received on a GET CCC without overwriting the requested
> buffer length in len.

Reviewed-by: Alexandre Mergnat <amergnat@baylibre.com>

-- 
Alexandre Mergnat <amergnat@baylibre.com>

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
