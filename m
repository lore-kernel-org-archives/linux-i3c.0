Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F4B3FCC9D6
	for <linux-i3c@archiver.kernel.org>; Tue, 10 Mar 2026 08:05:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ILkltj9PyzQnyNbowJvaVkyD8lVZ0fouZ1cbIz+0ZMI=; b=H5LVqNs/YvHb5q
	vjbRi34zQy1M/0h4/cI/ioNNipbdY5fCiTw+SIbqzeMuMwQN64ERql4Z2irKk6y6V3w9rYXU7PbRU
	+vqCy/4Y0m5J5aZ2s6Qe5BMf0ITshz9N5MXgP9ZffuhomDk3n1P3hl1cRg+SD94hjwM4CURWsMXFD
	zTf0ZLz53Ijk151ZYS8RJQ2gaWaAiXDOUPLwANq5RAiud86VIvtwX/pMGydfLkZaP4O5xvdGeVan/
	rYc7NP0mk2PXF9tNuU+7orAWamRQfNkXsOqtPGGAG6rAZgQbS/1Ki3lFspemQrngnjuBZ+ad4Otnr
	RVwBxkm2CMnMLvKu5Qqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzs5z-00000008uQg-0HzR;
	Tue, 10 Mar 2026 08:05:39 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzs5w-00000008uQJ-1JoV
	for linux-i3c@lists.infradead.org;
	Tue, 10 Mar 2026 08:05:37 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-4853e1ce427so18763895e9.3
        for <linux-i3c@lists.infradead.org>; Tue, 10 Mar 2026 01:05:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773129934; x=1773734734; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=7FT4Vx5K1bxjUJHAbXWhy/hDl5ZIbK/ysDxiY/aeStE=;
        b=PVSrjZB5+jpt4nMYKMtlcPz8FISG0Ns0ZEhQ8YUqJOm2vZHDFYErFszKRLdy3GyuIZ
         gD4roxgdBLWMMFCFRBksnANyY2F9xYWKd6Qrh0N754kb8gEPFw7aiVjbjfmdKh3iJ0Pg
         fYgI0sCoq2za9Z/MXa9snKeU2yB6Voho7wJyYPlgMR0unIYuzNKxqIZp+slFQWStt7VR
         5woGMqUX7o4eN8SyQ7jxJZclRQhxGXgs1mPMMssBI9ET3engKeDcte29Qa47vXZdeHet
         DoUUBhP3ZB58RLiVR07TWPj3e/UE+hm6SL35DIHRfDUBpAuKMkHnMuQjrhY2Ei2u0umf
         GNJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773129934; x=1773734734;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7FT4Vx5K1bxjUJHAbXWhy/hDl5ZIbK/ysDxiY/aeStE=;
        b=umijN47Ud0xxCHVwqtbppWDxZF+FTLbNdBUka/3B8bqnobDvqm0bCVQQTI925RZ8ll
         dylA57vQyFPDbwZzKeoQyRC8osIEfA66yqQoB4/NV0OhHjjUoErHO1SQGAI05O2P7k6W
         bumEqjk/0+ek0iIpg7V7vorRcSXcg1hbHFEn3Q90tLTgxbjp2mP6nrlWLRPevhO4s/+4
         6JltrE4SSMwVBJTm7JLGNuMEZlCuompSt3DweYAYNPJfxq2+mJ43+VOj9G9Nh3f6qlCR
         aqacHdkhFQYHY4sxOUp3/+dkrgdeTuTnCRpSgv5HqndJJwDQK2T3C9m2YKo6UT9SWYTn
         XqxA==
X-Forwarded-Encrypted: i=1; AJvYcCW2GYkwsAs7XseTtV6XAeqn4Xby8rkNCGEcRuFNk47WycdXPUBKP5mgJcpdWIwySme69qJRWnAWgLY=@lists.infradead.org
X-Gm-Message-State: AOJu0YwY7m1BBWCVjBZmdwerL3RKhfwvwXXB2yF2j7YyuuXZaBnSOK9I
	4NRYjfyuPs15SpkwCwLbonUbGurFJnr4kNjOvHempnThi1tM+LsODHc8
X-Gm-Gg: ATEYQzxTCHXoSrM+WBB6VX6coWsJ4u/gvM8mC2y9nIa2us+S77qzcnBQle0I4Up1lyF
	g7OxkvJ3Adyubhwg7t3jjO5bVstcHxjlT9eGlLHPLCBF5Y2ndDAFTmnF/GjnplC8XNBUM4awD6Y
	exwgpGft5kEJjVnpZLTdhEeO1WyOtecQhLSJoQ5aAm3z4tAIVUWNJzQm7X4WeFv7aujzIg8JNCP
	bByw7PhMDijdhDO1nqDXElqrGMCnHvY+O4P5AUBVP/VDaZD8YZi3tzNfm+cEhvTbVnQPe1aeLyl
	i97K1IRsnO/KJUGR+Oc3Ekd4izriBY0iyptcrFKyS/TllbedXt4S0iyFr+l9xoupCZbL9TLHJ3Q
	oyr2pqtTFHKWQYNZ7FIRl6OBHZQE+zpYrVS4rmZjSfXKSxFe4ZsMdY1mxsA5v9gEHTJ6tUIYoY2
	JQ7AS1u7JgIP0VYK9LqqXfu6sYkwsYtS84Qiwhq11eWHypv/3yy8iDH+yMZhBYeLBBS/ng64q4T
	RSjugTmr8vdM5PB1Gdo4piW7PuRFWF68FCzuaL4eWAc5C0/UokPF6KtiwOu/634Zw==
X-Received: by 2002:a05:600c:4447:b0:485:34b3:8587 with SMTP id 5b1f17b1804b1-48534b38969mr139916115e9.10.1773129934084;
        Tue, 10 Mar 2026 01:05:34 -0700 (PDT)
Received: from HYB-DlYm71t3hSl.ad.analog.com ([137.71.226.102])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4852f369118sm100117715e9.20.2026.03.10.01.05.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Mar 2026 01:05:33 -0700 (PDT)
Date: Tue, 10 Mar 2026 09:05:30 +0100
From: Jorge Marques <gastmaier@gmail.com>
To: Adrian Hunter <adrian.hunter@intel.com>
Cc: Jorge Marques <jorge.marques@analog.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Frank Li <Frank.Li@nxp.com>, 
	=?utf-8?Q?Przemys=C5=82aw?= Gaj <pgaj@cadence.com>, linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Dan Carpenter <dan.carpenter@linaro.org>, Jonathan Cameron <jic23@kernel.org>
Subject: Re: [PATCH 1/5] i3c: master: Move rstdaa error suppression
Message-ID: <c3lyva3q6yqbeoa4vzmxx2mhnffahpzljcm2cntppenkmntisg@fniqac3weif6>
References: <20260308-ad4062-positive-error-fix-v1-0-72d3c5290b4a@analog.com>
 <20260308-ad4062-positive-error-fix-v1-1-72d3c5290b4a@analog.com>
 <458bbbb3-babd-45d2-b290-435811058ba3@intel.com>
 <k63sp56mbqje2wqo6yjcql27ag7pkwbuwch7llnal7j6sww4wp@3bnal4rcgpzn>
 <62db3005-500d-4110-ad63-9cd200965724@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <62db3005-500d-4110-ad63-9cd200965724@intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260310_010536_371322_22F8C618 
X-CRM114-Status: GOOD (  21.30  )
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

On Mon, Mar 09, 2026 at 02:34:58PM +0200, Adrian Hunter wrote:
> On 09/03/2026 14:17, Jorge Marques wrote:
> > On Mon, Mar 09, 2026 at 01:39:36PM +0200, Adrian Hunter wrote:
> >> On 08/03/2026 18:47, Jorge Marques wrote:
> >>> --- a/drivers/i3c/master.c
> >>> +++ b/drivers/i3c/master.c
> >>> @@ -1016,6 +1016,10 @@ static int i3c_master_rstdaa_locked(struct i3c_master_controller *master,
> >>>  	ret = i3c_master_send_ccc_cmd_locked(master, &cmd);
> >>>  	i3c_ccc_cmd_dest_cleanup(&dest);
> >>>  
> >>> +	/* No active devices on the bus. */
> >>> +	if (ret && cmd.err == I3C_ERROR_M2)
> >>> +		ret = 0;
> >>> +
> >>>  	return ret;
> >>>  }
> >>>  
> >>> @@ -1785,7 +1789,6 @@ i3c_master_register_new_i3c_devs(struct i3c_master_controller *master)
> >>>   */
> >>>  int i3c_master_do_daa_ext(struct i3c_master_controller *master, bool rstdaa)
> >>>  {
> >>> -	int rstret = 0;
> >>>  	int ret;
> >>>  
> >>>  	ret = i3c_master_rpm_get(master);
> >>> @@ -1795,9 +1798,9 @@ int i3c_master_do_daa_ext(struct i3c_master_controller *master, bool rstdaa)
> >>>  	i3c_bus_maintenance_lock(&master->bus);
> >>>  
> >>>  	if (rstdaa) {
> >>> -		rstret = i3c_master_rstdaa_locked(master, I3C_BROADCAST_ADDR);
> >>> -		if (rstret == I3C_ERROR_M2)
> >>> -			rstret = 0;
> >>> +		ret = i3c_master_rstdaa_locked(master, I3C_BROADCAST_ADDR);
> >>> +		if (ret)
> >>> +			goto out;
> >>
> >> This is an unrelated change.  The original intention was to perform
> >> DAA even if RSTDAA fails.  If you really want this, it needs to be
> >> a separate patch with separate justification.
> >>
> >>>  	}
> > Hi Adrian, handling I3C_ERROR_M2 is unchanged.
> > 
> > The intention is to perform the DAA if the RSTDAA fail due to a
> > I3C_ERROR_M2, this behaviour is unchanged,
> No, the intention was as the code is written.  DAA is done
> irrespective of whether RSTDAA fails.  The behaviour has changed:
> before it always does DAA, after it does not always.
> 

Hi Adrian, you are right, the og behaviour is to continue on any error.
v2 will bring the rstret back, thanks for pointing out! For context, did
you experience peripherals/controllers that failed with
err != I3C_ERROR_M2 on RSTDAA? Would be nice to map at least one
non-spec-conforming case.

Best regards,
Jorge

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
