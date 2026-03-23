Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 847DFF483C1
	for <linux-i3c@archiver.kernel.org>; Mon, 23 Mar 2026 16:05:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Djfd62PLYjXuFwV3WeQMOaMcsGI04udVwVlUC8udELM=; b=BYsXK7VXAQFiRP
	/CUWaiq10kD/fvKXMysQBfpfeUdy+I4o50Q5AXWOhcgd8Ny+uZPdJ9Y3wQgk1VBcRBdC9Ty8L6ZPn
	cHTMAszkfGtZQfc/f+gAhAmTT6xYNQEaPIY0LdRi9Hvb9iXBVPPyVE8lvbHV6FqRaLxBE7+GW1A3+
	CCMRKIAqVhjqye56hrF28LVRjG70QBj/DlIhu4mNRYWddGHNAPqwx+lxJSnHU4snEAYAJWtn9PaMn
	YHvbicYcAsa1wcQ4DNGzbqQgcemqlOmam29xu2VdzLxC8QqzG1qpYA3efyGlAz0IZqD0vtyLpTGq2
	CIcx0td0BlQcw4RR3GBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4hm5-0000000H5sk-1DTo;
	Mon, 23 Mar 2026 16:05:05 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4hm2-0000000H5s1-1Jnq
	for linux-i3c@lists.infradead.org;
	Mon, 23 Mar 2026 16:05:03 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-486b9675d36so35787695e9.0
        for <linux-i3c@lists.infradead.org>; Mon, 23 Mar 2026 09:05:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1774281900; x=1774886700; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=v5ZDJ4qudp2rQRGPYBel6jjCM9KUk/GHKvVqDYjz7dw=;
        b=ipaRcPB79QlzXU4eurYL05idoXfRRGIc9oy/eypVHA4QnB0KellF5A+DHql6CAngBo
         /ZqXxE3ZY0YIqBPX4fHWFtkfStdxzEX5V/QQFil2AsAEXgV3fp8oRZYJMk12HYxpyqEd
         hpSpoMrkUTfLc/uYXV9gXjUjq3YudWtTG3TdmLjsB2wqo5Pirr4WY0g6we9F+F83VbLQ
         Q+wi+kcY0ydYLXcNIqzWwoSvP8zSA2KS/x1iVFhOvF1fh9GbkOZF+1VOt+G4r1VkbSji
         enJTWJ9CcRfVCV56RcKgsS0C7RE60IXqEe9L/RII/x7WHduvELxjDsGDKaizUFXoBFpo
         knlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774281900; x=1774886700;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=v5ZDJ4qudp2rQRGPYBel6jjCM9KUk/GHKvVqDYjz7dw=;
        b=IJhaSxo9J8hg2bGALJeEhx94eoUhN72TIssD9CxkRFitrD0WbU+c4ORdS258lF8dhm
         bDmOowqxL8C1JQmluGRaZIbwhG9u7++GWd8XKh7m1RpvpPNtQmpqoMwzr05vO9fRD/nu
         2/FZXKklndUBujqr+8qdqofREIhryp0NZjLYiEtnvKcOCxg5QJ4CYxtzX5xGSUHYDg7+
         JvMEKQF0a31vMg1aG73xsZpgnm7bN856wHQDlLae+6nanVRftqeQrWzy5btupnGPnXlJ
         WQg/+eRdXpAZ5vwsnqgSnCTTnO1rdISNC29Whohwohnv3/u+2oZdbqpg61bvowKBBedP
         OS0A==
X-Forwarded-Encrypted: i=1; AJvYcCWolrg4D/APciH4sifLPIRjlSgim4QzDtljPlyStc6cSNbZE5C1nV/0Ma8dfAV40rWGR41lH8pqpwE=@lists.infradead.org
X-Gm-Message-State: AOJu0Yx1L33tD4JvU8mdbRTXPg9FTFu3N9wRYwYVd8RkD93L5JO426yd
	GjMcYXdzwYXi2M6WdYCEdpKwzxRpHTUODFIzKHxhQ5y8bmVN4AoBpoo8
X-Gm-Gg: ATEYQzyJfUDXboPFhEt5Y5S+B1j1quEN3DD0CpiR4niZWkKvIZZB/9TskSxB6QHeVVe
	w77YbKMTyebvG3sMaznHD56z+ZMkgRio5t13t+3mA5lA6vlASYdC+Ea2oZE3TQegBOhx74tOcYf
	/Ya2oZtmRs4NSbKvrdPKV/XSM5Cixgd6iQmBPt/mJMhNxdhKluFGQYfGgMydjoN04WBM5Wph/na
	PBrbcE4nom0gTtjbL59DYQ+kK2Bfb453pWbKwNPul1KEUJZeyBNRFvnue/72H7+bZd5WF62B87v
	3GgA2B/YYF8U6dI1QOOZv7gWrDRlfNdhvyFXLJfdIl2xTd7uAue1tuIPr+4KXVEzBXRk1q3gKKV
	rTvicJlVlJlzpysRYxkGyvL6lxpmXrhbPGDZIGT/4xDmuhnZQsmhoAZ02BhfvGrljVPyeD4hz0l
	WWtNQPHi4j6X/+828L7s2xz1a9nXCfm8ldcMQgJmNm6mMM5PMeW/EpoXhBk7iQ+girLXqSH6Pcu
	GT1ZVTHha/K5CWKlKeti3bAbya4NYSqF+rxPsfKnyT4Wxd06KKCdDTXUQyn+kQB
X-Received: by 2002:a05:600c:46c8:b0:485:3d3e:167b with SMTP id 5b1f17b1804b1-486febb59a1mr181933055e9.5.1774281900135;
        Mon, 23 Mar 2026 09:05:00 -0700 (PDT)
Received: from HYB-DlYm71t3hSl.ad.analog.com ([137.71.226.102])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-487004e7bc4sm118703145e9.2.2026.03.23.09.04.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Mar 2026 09:04:59 -0700 (PDT)
Date: Mon, 23 Mar 2026 17:04:57 +0100
From: Jorge Marques <gastmaier@gmail.com>
To: Frank Li <Frank.li@nxp.com>
Cc: Jorge Marques <jorge.marques@analog.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, =?utf-8?Q?Przemys=C5=82aw?= Gaj <pgaj@cadence.com>, 
	linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Dan Carpenter <dan.carpenter@linaro.org>, Jonathan Cameron <jic23@kernel.org>
Subject: Re: [PATCH v2 4/5] i3c: master: Fix error codes at send_ccc_cmd
Message-ID: <qa3jl7k4e36bscqgtqi5ziu6nriekck5vpukqgxedkglc4bqm6@ngv3nrlciux5>
References: <20260312-ad4062-positive-error-fix-v2-0-1c933b5c7ed8@analog.com>
 <20260312-ad4062-positive-error-fix-v2-4-1c933b5c7ed8@analog.com>
 <abq2PZY3cz1-mmgV@lizhi-Precision-Tower-5810>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <abq2PZY3cz1-mmgV@lizhi-Precision-Tower-5810>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260323_090502_805198_D7EB174D 
X-CRM114-Status: GOOD (  12.28  )
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

On Wed, Mar 18, 2026 at 10:27:09AM -0400, Frank Li wrote:
> On Thu, Mar 12, 2026 at 05:38:07PM +0100, Jorge Marques wrote:
> > i3c_master_send_ccc_cmd_locked would propagate cmd->err (positive,
> 
> function name need (), i3c_dev_enable_ibi_locked(), check others.
> 
> > Mx codes) to the ret variable, cascading down multiple methods until
> > reaching methods that explicitly stated they would return 0 on success
> > or negative error code. For example, the call chain:
> >
> >   i3c_device_enable_ibi <- i3c_dev_enable_ibi_locked <-
> >   master->ops.enable_ibi <- i3c_master_enec_locked <-
> >   i3c_master_enec_disec_locked <- i3c_master_send_ccc_cmd_locked
> 
> why "<-" , look like should be "->" Or
> 
> 	i3c_device_enable_ibi()
> 	i3c_dev_enable_ibi_locked()
> 
> function need (), i3c_dev_enable_ibi_locked(),
> 
> >
> > Fix this by returning the ret value, callers can
> > still read the cmd->err value if ret is negative.
> 
> Can you wrap at 75 char.
> Fix this by returning the ret value, callers can still read the cmd->err
> value if ret is negative.
> 
> Frank

Ack all review comments.

Regards,
Jorge

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
