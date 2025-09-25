Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4FDD0CAC5AA
	for <linux-i3c@archiver.kernel.org>; Thu, 25 Sep 2025 07:21:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=B3glGkmzYGxDL58XNwjwGODBGeHoatTK20GFSgeUT80=; b=FpWVZeOSvS1u38
	70l2wcVdp5D0dR1bSh/ncWrhfqz6Chxa6eknJSsTA5m11OaMaL/L4iKrlIAPkCgDjq/+I5PSm4jn1
	zHMx/jeEwZPVryomcj2aitYHt4StaR8puyvstC0Hhh/0u1JJ2pG0SqAw1chdPK5au7yahJDOffaPt
	Ue0saDpXglCCCW2mwHxWYUZS1vJiEQ7/T6e1MexANSFKQ5w8gUGbaluUCiImX8uVYi5yIEuh+H4jq
	JlBiQjoncHo6t7Ef8lCICuxJgzaYxtS/x7PWqEKoCsfvcwRNsoKLdZrGFJ7vqMTAZ4L64UU/Jg5zG
	icPauJd49zp46gsDn2sQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1gHm-00000006fF7-0LKE;
	Thu, 25 Sep 2025 07:21:02 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1gHj-00000006fEX-2gwo
	for linux-i3c@lists.infradead.org;
	Thu, 25 Sep 2025 07:21:00 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-46e37d10f3eso503935e9.0
        for <linux-i3c@lists.infradead.org>; Thu, 25 Sep 2025 00:20:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758784858; x=1759389658; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=5GK9C8KtH9+DmOnUEwg3Z7jsK5ZGy4qBPWOBOcMNRJw=;
        b=VJQ8TUDp0KuFTyRihizS5jYQRf24XYrryKEo530ebOrOqTElH1zAGijA/EmNHTMJfb
         ILCMvUXv9VxbKZ2ql5nRe8HDNFN8DEJW8RnKY3oxZAuCf+BEMYJf1ztSYtKOfsnJY61H
         ft0XqA/0k8c8WcT64RIiAatPPX+C98JD9daiii8zGzEvOcuF2T+fHsVnIeb2C41EgtD7
         w4AhxFMedvyVVzt692VlI/bVc2VemB3kV3K8zS/9KFUfK8KSYsxjkMQX//gf+nXeDW4G
         7DU5xoXxJ1rzSaQlxEcNJCjjsRMDps5GQ4kQiGOelgglFtm3pfkbRsdGvGT72aN1vz6v
         Iq9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758784858; x=1759389658;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5GK9C8KtH9+DmOnUEwg3Z7jsK5ZGy4qBPWOBOcMNRJw=;
        b=Lo1dyUfOsOfyIYH5hg0e/rWnqaahAqfo5BXAqhVx68/oI7HOQbxZ+BCoacwMmqOyG7
         tiWSZapBnjltpGynYGNxA2XWx7n8+hDAAfe2J+OeAQZSYMgZ18gMQAIW/cvvUeRX6ZQa
         ljAIEA5Mq0g9wOJ3tzyQMTPfL2ifUnvjq1gakj8EDvH/11ZlytZsdSjgqt5fvlDlus8n
         Wz53eV8HnZuPGceXiE8yK2hP6kal6sUeZRHRDAjeBhl2g3jtG16dvAZcxavMJPdoCKjZ
         MjKRoRvh5NoqI5VVKA3kRJlfMa+mBaN/UsICutOn/ZTWijAjgfRdL2UbOGPUWXQ+Qrs+
         gNIw==
X-Forwarded-Encrypted: i=1; AJvYcCWln0BQLq4tt7MEXvnYzNj/AXYMJnsa/pN4phDagXqWTWO46oj/LSh/P5BzIz/9AtwpDDiQFtwXBjU=@lists.infradead.org
X-Gm-Message-State: AOJu0Yz3sulsXB0BjU4sNr0xdVZbKzJOlhZpx0v3fvLplNYib6lKHHTr
	u5qbkxVx0QSQV8Wys/JE2q8MHao95Pq3hojshCpXuvoMJCC3btXFZ3q5
X-Gm-Gg: ASbGncv6tXgEt6GH0bi0IUhrkQXSP79Z2ttiQq9Id01GQuK5FGUoOKpjRBbu65rDBCS
	PxKvaxLpvPCu+JtCZN04rLU+HleS8OF/8ORWAaGQJPRFSx4wtruaKWx41aO83AqEnF14tdx6HpC
	RRsH57LmWIIvjOSajDTIRstOEnmbYBvzza/qpEeK3hP7nIvZXxj10r3zOzz4320u3CG0YT+sBny
	PIRkkE4Wxk4I46Chlqp2sykKT49GCpKvYOJc2ctaX4js48D820Z0l4BF261Z6c11P73t7Fz1HoS
	g1Tc3XJJebzvJXP4PZT/AvpSY9eQgfhrNDjfh8irsVWrGjQ+4JlkgSiIj17hLdxb7nJRXI97T+E
	qm/hcwxTtQS8iKpaNej01OOFF2wEQY/lWI7PGVrbcqkA=
X-Google-Smtp-Source: AGHT+IGZPO/i3EVx1oz0F6ZoZjaPP23o7cGrNgiXJrqYKEIkHenYM007xkUk74i7Lp80iQ9soiKOCA==
X-Received: by 2002:a05:6000:3102:b0:3ee:3dce:f672 with SMTP id ffacd0b85a97d-40e492fdc2emr1826364f8f.4.1758784857530;
        Thu, 25 Sep 2025 00:20:57 -0700 (PDT)
Received: from HYB-DlYm71t3hSl.ad.analog.com ([137.71.226.91])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-46e32c10823sm12335125e9.3.2025.09.25.00.20.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Sep 2025 00:20:57 -0700 (PDT)
Date: Thu, 25 Sep 2025 09:20:55 +0200
From: Jorge Marques <gastmaier@gmail.com>
To: alexandre.belloni@bootlin.com
Cc: Jorge Marques <jorge.marques@analog.com>, Frank Li <Frank.Li@nxp.com>, 
	kernel test robot <lkp@intel.com>, linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] i3c: master: adi: fix number of bytes written to fifo
Message-ID: <5cwo5whsjmyruxmx4kl4opy6qylzzyoodeyqubgpxnlzcgd3ik@2n3gbz5dqtdk>
References: <20250924195600.122142-1-alexandre.belloni@bootlin.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250924195600.122142-1-alexandre.belloni@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250925_002059_684201_78997190 
X-CRM114-Status: GOOD (  16.74  )
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

On Wed, Sep 24, 2025 at 09:56:00PM +0200, alexandre.belloni@bootlin.com wrote:
> From: Alexandre Belloni <alexandre.belloni@bootlin.com>
> 
> adi_i3c_master_wr_to_tx_fifo computes the maximum number of bytes that can be
> sent to the fifo but never makes use of it, actually limit the number of bytes
> sent.
> 
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202509190505.fKGvEJRa-lkp@intel.com/
> Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
> ---
>  drivers/i3c/master/adi-i3c-master.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/i3c/master/adi-i3c-master.c b/drivers/i3c/master/adi-i3c-master.c
> index 18597ba1f1c3..82ac0b3d057a 100644
> --- a/drivers/i3c/master/adi-i3c-master.c
> +++ b/drivers/i3c/master/adi-i3c-master.c
> @@ -135,7 +135,7 @@ static void adi_i3c_master_wr_to_tx_fifo(struct adi_i3c_master *master,
>  
>  	n = readl(master->regs + REG_SDO_FIFO_ROOM);
>  	m = min(n, nbytes);
> -	i3c_writel_fifo(master->regs + REG_SDO_FIFO, buf, nbytes);
> +	i3c_writel_fifo(master->regs + REG_SDO_FIFO, buf, m);
>  }
Reviewed-by: Jorge Marques <jorge.marques@analog.com>
>  
>  static void adi_i3c_master_rd_from_rx_fifo(struct adi_i3c_master *master,
> -- 
> 2.51.0
> 

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
