Return-Path: <SRS0=WTHI=QG=lists.infradead.org=linux-i3c-bounces+linux-i3c=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 315E2C282D4
	for <linux-i3c@archiver.kernel.org>; Wed, 30 Jan 2019 07:56:45 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F36C120882
	for <linux-i3c@archiver.kernel.org>; Wed, 30 Jan 2019 07:56:44 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Cb+vl2dT";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="t7xfm6Qf"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F36C120882
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+eSEMMCsq50iU4IUFnfF3p8TB08maqImk+TiWfHAR1U=; b=Cb+vl2dTST9Q0S
	aCqR+rgm05zwmKA7hPH+OR+TyDY2YqonrrQVLcej+9mNdvb14moPFkV0tqfvRhOUy9cbHNR74hgxm
	DPeteTJvSEIoz2o5ygjQm94Glm+Nmg5CFF+nXGaH22yxqCTstMPj+5VyF84gPoqa1aDqyy9JYjRK3
	xZblBzsS4zlNrzDP1loLkQNQWb2T7tB7qXN2uoivKRCvOXoPuwz6yc3ZFnYreDyxs+MvCdcJP5O5B
	4vW0f57KQcQM976ho2+d5Oc9VtG/NjgC/ODuaCxftbTGV+llASXZ+mFHFJp8H+JUBxWGk1zk9XTfG
	MFwUsF70usHYUyEKPxpg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gokjk-0002Ac-Js; Wed, 30 Jan 2019 07:56:44 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gokjc-0002A9-2t
 for linux-i3c@lists.infradead.org; Wed, 30 Jan 2019 07:56:43 +0000
Received: from bbrezillon (91-160-177-164.subs.proxad.net [91.160.177.164])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 3C4AA20882;
 Wed, 30 Jan 2019 07:56:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1548834995;
 bh=HBqwdX/ogc4xX+WI9fyRMynoctB4Z09wRdmB2GIQUy4=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=t7xfm6Qf5vUj4g9MkzWgEkh8YoaB1m+IO0tB7pE5YtU8gp1Z7Z3vknl6Ia7TZrqMI
 rX3HDrnEwc0rhgSVMe0zZfVcUkCBvHxVhWy4dQs0YhkZ+QKaY5yldTqritQpI55IvV
 epCY72VvAygvv+W+sTs479UBmEiJyHNWukVSs+U0=
Date: Wed, 30 Jan 2019 08:56:26 +0100
From: Boris Brezillon <bbrezillon@kernel.org>
To: Przemyslaw Gaj <pgaj@cadence.com>
Subject: Re: [PATCH v2 1/3] i3c: Add support for mastership request to I3C
 subsystem
Message-ID: <20190130085626.7576b311@bbrezillon>
In-Reply-To: <20190129181335.GA8271@global.cadence.com>
References: <cover.1547227861.git.pgaj@cadence.com>
 <1eca82e2d7bbff19597b78a3ce1ad62273015529.1547227861.git.pgaj@cadence.com>
 <20190115220953.400d06e7@bbrezillon>
 <20190129181335.GA8271@global.cadence.com>
X-Mailer: Claws Mail 3.16.0 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190129_235639_683090_C0A879A3 
X-CRM114-Status: GOOD (  18.15  )
X-BeenThere: linux-i3c@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: Linux I3C <linux-i3c.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-i3c>,
 <mailto:linux-i3c-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-i3c/>
List-Post: <mailto:linux-i3c@lists.infradead.org>
List-Help: <mailto:linux-i3c-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-i3c>,
 <mailto:linux-i3c-request@lists.infradead.org?subject=subscribe>
Cc: linux-i3c@lists.infradead.org, psroka@cadence.com, rafalc@cadence.com,
 vitor.soares@synopsys.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org

On Tue, 29 Jan 2019 18:13:37 +0000
Przemyslaw Gaj <pgaj@cadence.com> wrote:

> The 01/15/2019 22:09, Boris Brezillon wrote:
> > EXTERNAL MAIL
> > 
> > 
> > On Fri, 11 Jan 2019 17:43:35 +0000
> > Przemyslaw Gaj <pgaj@cadence.com> wrote:
> >   
> > > +		i3c_bus_normaluse_unlock(i3cbus);
> > > +	}
> > > +
> > >  	i3c_bus_normaluse_lock(i3cbus);
> > >  	ret = sprintf(buf, "%d-%llx\n", i3cbus->id,
> > >  		      i3cbus->cur_master->info.pid);
> > > @@ -663,6 +728,12 @@ static int i3c_master_send_ccc_cmd_locked(struct i3c_master_controller *master,
> > >  		    !rwsem_is_locked(&master->bus.lock)))
> > >  		return -EINVAL;
> > >  
> > > +	if (!i3c_master_owns_bus(master)) {
> > > +		ret = i3c_master_request_mastership(master);
> > > +		if (ret)
> > > +			return ret;
> > > +	}  
> > 
> > As I said above, I think bus ownership should be requested in
> > maintenance mode, which means it has to be done before entering this
> > function. You can probably start acquiring the lock in write (AKA
> > maintenance) mode and downgrade it to read (AKA normal) mode before we
> > start sending the frame (CCC, SDR, I2C or HDR). 
> >   
> 
> So, I'll have to call all the _locked functions with maintenance lock.
> Inside i3c_master_send_ccc_cmd_locked() I will downgrade the lock to read
> (normal use).

No, definitely not. The prefix _locked() means that the lock has been
acquired by the caller, and the function itself is not responsible for
downgrading the lock. What I meant is that the
i3c_master_owns_bus()+i3c_master_request_mastership() sequence does not
belong in xxxx_locked() funcs. It should be done by the caller with the
lock held in write/maintenance mode, and then downgraded to a read/normal
lock once the bus has been acquired. i3c_master_send_ccc_cmd_locked()
was probably not the best example, as this function might be
intentionally called with the lock held in write/maintenance mode
sometimes (depends on the CCC command), but for other funcs, it should
be pretty easy to do:

int i3c_master_acquire_bus_ownership_locked(struct i3c_master_controller *master)
{
	if (i3c_master_owns_bus(master))
		return 0;

	return i3c_master_request_mastership(master);
}

int i3c_device_do_priv_xfers(struct i3c_device *dev,
			     struct i3c_priv_xfer *xfers,
			     int nxfers)
{
	...

	i3c_bus_maintenance_lock(dev->bus);
	ret = i3c_master_acquire_bus_ownership(master);
	if (ret) {
		i3c_bus_maintenance_unlock(dev->bus);
		return ret;
	}

	i3c_bus_downgrade_maintenance_lock(dev->bus);
	ret = i3c_dev_do_priv_xfers_locked(dev->desc, xfers, nxfers);
	i3c_bus_normaluse_unlock(dev->bus);

	return ret;
} 

> Isn't it inconsistent that after _locked functions I will
> unlock the bus from normal use, even if I locked it for maintenance?> 
> Also, I will have to downgrade the lock in case of failure in all _locked
> functions to unlock the bus properly using i3c_bus_normaluse_lock(). DO you
> think this looks good?

No, see above for an explanation.

_______________________________________________
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
