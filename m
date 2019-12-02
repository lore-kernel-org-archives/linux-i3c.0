Return-Path: <SRS0=9Te0=ZY=lists.infradead.org=linux-i3c-bounces+linux-i3c=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B8CE5C432C0
	for <linux-i3c@archiver.kernel.org>; Mon,  2 Dec 2019 10:32:23 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8AE56206F0
	for <linux-i3c@archiver.kernel.org>; Mon,  2 Dec 2019 10:32:23 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ChLEibvE";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=cadence.com header.i=@cadence.com header.b="AqCFp4gL";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=cadence.com header.i=@cadence.com header.b="seqyDDpZ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8AE56206F0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=cadence.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gjSDZym9UAnMTUxtrPAd8B81nf2hHdguQLI9uLsoJ/8=; b=ChLEibvEPR8vRg
	hlIdKzLcH3DB1X7JB2yZQpgcJ3IXMISzY+8DxiXlkZoy1hfOiGA/gKnxNBHYNAvnwpGEHjwT14XI4
	33pKahv4bKLi2IoULkU93G9Zps+sWix+fqgnX1NuM+A94il2iDbEpVF3WKV6+V3ONqhn6al3PI3GU
	mfSX3vAWIgIgB+8BePEw87O9tT6H8wo+gtb6Fb5UYTbxh9J1MueeI1lxr2HJg54Cf6WY5v0OFoEkD
	kiW9WL3vnnMe3tO8ssS1oHbHR5CXJ7h/UZQwefzJc06qpfAd8y0Zsyuff3mFrEzM98H2gqOnUrxQ9
	I5aS5kyr800FLHF0/rIw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ibj09-0000lz-QP; Mon, 02 Dec 2019 10:32:21 +0000
Received: from mx0b-0014ca01.pphosted.com ([208.86.201.193]
 helo=mx0a-0014ca01.pphosted.com)
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ibizW-00008y-TE
 for linux-i3c@lists.infradead.org; Mon, 02 Dec 2019 10:31:48 +0000
Received: from pps.filterd (m0042333.ppops.net [127.0.0.1])
 by mx0b-0014ca01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 xB2ASpeM019807; Mon, 2 Dec 2019 02:31:38 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cadence.com;
 h=date : from : to :
 cc : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=proofpoint;
 bh=fIcXK9fwn0Bbgs0EBvHhFoctqe+4rZECujKvM951Liw=;
 b=AqCFp4gLKfkz9JQICnS5PPe4xyLTy4VGuoLBGLf2w3kjJsPbwY8a4c9AGC7sXUQiEUKG
 Tgh+FrV/N4dEyqMaMNZJkp2p221THUchwnMc+uqP6VnKVUrZGYjaM1hKzTRW4zCPmsVY
 QFaBerMtteZjp9Fi3iEbtx2JZizpKj2Q4WOQ6zXUyS+HNW3X22j6j98EKQjeDTiTl/E0
 GtH92zTKJe8QDlwOcDco6yMkicrC/Plt8gAhzLl3lZPPSaW+0MQjWQ/0hsudMcodk1Dr
 Xp0bRIQR3sl64dcrRT66tuerFzHF+8XmPXOImn5EgC8bwKo4bsjpPxCjYBdOQnJQPuU4 2g== 
Received: from nam01-bn3-obe.outbound.protection.outlook.com
 (mail-bn3nam01lp2059.outbound.protection.outlook.com [104.47.33.59])
 by mx0b-0014ca01.pphosted.com with ESMTP id 2wkmvyq7a9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 02 Dec 2019 02:31:38 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ivs5VwZC+wkjJeAIm6UJNt6LS425eemDOqBDxRqkp59LCJR0YCsxRL8hz0Tpl/8sJqWc7FDSdiB4xrvcv+n938ysAvyFFK00nR0i6KkAjPD2vAFjlFVweTJ0Ulrd6dxtrQGxzpyCkf6Vp+7sItikVtwxFpuxgt+XSt0YWXw3OlqrOhAo5gsQsRfOi6R6aA1znYAmfkTx6qWgCUxl9n638ZzLoeRWQSbft+69rjKSxBXTKabF+7hGW/rLPOukvMnw2rlFTHT1FtfaXJd+ztZhZgE1z+fPTXOjSurXncNHZPgnwRPmqn+xtxOdxt/Ujl+QAJYhf1nXjxQwNyMsMuXoHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fIcXK9fwn0Bbgs0EBvHhFoctqe+4rZECujKvM951Liw=;
 b=N8RMNgHiJjoSCmUOsQ4lH9IxYaWdzoPoS5CUu0uv+mUDQnNJkvaG4lnJzjjXt6SbynpHMRonjPxZeHuuEI8pxJd17NWFsOUM9QdW+NRSuczvC1s9FLugLU030vhjbdtdzD6f1LiQYsU1JERhHQZTxjTDsn2sbZ8Qw4xSXDYgRC7w7MqjjP2oxa7nPE1PwdmSUW25X1CrTDvtK6HI4ZpZ0vSaSJduXE2SFp08p74Zl8A+PUR5XYR8c0rh5BKT8q9+7gi2vvS4oZ5k85/59k2OVxGkOA0fQfDlQJqDSiaMv/wjTkKV8VBMKOxfonOFQmhOrrb1d1Wf+ghWrtR8q/m6eg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 64.207.220.243) smtp.rcpttodomain=lists.infradead.org
 smtp.mailfrom=cadence.com; dmarc=pass (p=none sp=none pct=100) action=none
 header.from=cadence.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cadence.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fIcXK9fwn0Bbgs0EBvHhFoctqe+4rZECujKvM951Liw=;
 b=seqyDDpZVyorIyTjsP/4Gv28yZSTarNEI4VDt4qG3s13nz4vv96ycv4Y0bjZTz9oSskqzVAo7F9CWBNrSfu8owBT24clt/MqLdIk8KekIa1Otfg/RM2OY+IXsDhCA93n0X3MxWQmkXVhUT6woKrfwGwOuZVndroEyVeJEB1s1so=
Received: from CH2PR07CA0010.namprd07.prod.outlook.com (2603:10b6:610:20::23)
 by BN8PR07MB6066.namprd07.prod.outlook.com (2603:10b6:408:98::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2495.22; Mon, 2 Dec
 2019 10:31:35 +0000
Received: from MW2NAM12FT021.eop-nam12.prod.protection.outlook.com
 (2a01:111:f400:fe5a::209) by CH2PR07CA0010.outlook.office365.com
 (2603:10b6:610:20::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2495.17 via Frontend
 Transport; Mon, 2 Dec 2019 10:31:35 +0000
Received-SPF: Pass (protection.outlook.com: domain of cadence.com designates
 64.207.220.243 as permitted sender) receiver=protection.outlook.com;
 client-ip=64.207.220.243; helo=wcmailrelayl01.cadence.com;
Received: from wcmailrelayl01.cadence.com (64.207.220.243) by
 MW2NAM12FT021.mail.protection.outlook.com (10.13.180.88) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2495.18 via Frontend Transport; Mon, 2 Dec 2019 10:31:33 +0000
Received: from mailsj6.global.cadence.com (mailsj6.cadence.com
 [158.140.32.112])
 by wcmailrelayl01.cadence.com (8.14.7/8.14.4) with ESMTP id xB2AVUlT010939
 (version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=OK);
 Mon, 2 Dec 2019 02:31:31 -0800
X-CrossPremisesHeadersFilteredBySendConnector: mailsj6.global.cadence.com
Received: from global.cadence.com (158.140.32.37) by
 mailsj6.global.cadence.com (158.140.32.112) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Mon, 2 Dec 2019 02:31:29 -0800
Date: Mon, 2 Dec 2019 11:31:26 +0100
From: Przemyslaw Gaj <pgaj@cadence.com>
To: <vitor.soares@synopsys.com>
Subject: Re: [PATCH v5 2/7] i3c: split i3c_master_register into init -
 register pair
Message-ID: <20191202103124.GA27882@global.cadence.com>
References: <1561236905-8901-1-git-send-email-pgaj@cadence.com>
 <1561236905-8901-3-git-send-email-pgaj@cadence.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1561236905-8901-3-git-send-email-pgaj@cadence.com>
User-Agent: Mutt/1.5.20 (2009-12-10)
X-Originating-IP: [158.140.32.37]
X-ClientProxiedBy: mailsj6.global.cadence.com (158.140.32.112) To
 mailsj6.global.cadence.com (158.140.32.112)
X-OrganizationHeadersPreserved: mailsj6.global.cadence.com
X-EOPAttributedMessage: 0
X-Forefront-Antispam-Report: CIP:64.207.220.243; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(396003)(376002)(39860400002)(346002)(199004)(189003)(36092001)(52314003)(956004)(6246003)(55016002)(33656002)(6286002)(305945005)(7736002)(6666004)(356004)(2351001)(11346002)(76176011)(446003)(53416004)(7696005)(6916009)(14444005)(23676004)(70586007)(8676002)(5660300002)(336012)(2486003)(386003)(3846002)(66066001)(6116002)(47776003)(70206006)(8936002)(50466002)(16526019)(186003)(478600001)(58126008)(54906003)(426003)(4326008)(316002)(106002)(16586007)(86362001)(229853002)(26005)(81166006)(81156014)(30864003)(2906002)(1076003)(36906005);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BN8PR07MB6066; H:wcmailrelayl01.cadence.com;
 FPR:; SPF:Pass; LANG:en; PTR:ErrorRetry; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1a7a23bd-d5a4-4d23-9ff2-08d77712cd78
X-MS-TrafficTypeDiagnostic: BN8PR07MB6066:
X-Microsoft-Antispam-PRVS: <BN8PR07MB60660417BB54ED0B99759199C2430@BN8PR07MB6066.namprd07.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:404;
X-Forefront-PRVS: 0239D46DB6
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: kqiPw9BMj+kVK9GNZKSW3dnlaIPQzwXGpxfcgSdLAIWARfiUL+0mbDjk+EmS1TNindvtkl8gbU/WUQ5oD62x7c+uboskDpB9Gidh10/LB3B17zqWa/QQPyOwWcPbpXjoqtiIzBgHNJFmuD1u8Ozt1JFY+aTQ0azAKaTQrFTAlgjjhor9L6lKTIciS0Y0AC0+9g2lTeFA6M1dPazzpuBO8ucNL3KDrPOHn+aVypAjZoVchVLO2h8cIfqi+qqU5NIFvWd0gTnOLNEPNLCWZjSwWHDo7NswE/ned1bWm885xnyrUDaMLc/5eJu/SjbsOwlBhWSta9SfBjPtnUAifWvUNQiSSpy7PytNcHYhujhkCXGSZrRUmCxAgULU5wD+TLzkz6PsU8XrLH9AVcF8v2XwCrI+hDVntWiAJ+u8IqlzmRP1aOvAzndIJCLVQRNPHJZk3sNDh1ZRdPH3sVhRce14UQ==
X-OriginatorOrg: cadence.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Dec 2019 10:31:33.6035 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1a7a23bd-d5a4-4d23-9ff2-08d77712cd78
X-MS-Exchange-CrossTenant-Id: d36035c5-6ce6-4662-a3dc-e762e61ae4c9
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=d36035c5-6ce6-4662-a3dc-e762e61ae4c9; Ip=[64.207.220.243];
 Helo=[wcmailrelayl01.cadence.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR07MB6066
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,18.0.572
 definitions=2019-12-02_01:2019-11-29,2019-12-02 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_check_notspam policy=outbound_check
 score=0
 priorityscore=1501 suspectscore=3 phishscore=0 spamscore=0
 lowpriorityscore=0 bulkscore=0 clxscore=1015 adultscore=0 mlxlogscore=999
 malwarescore=0 mlxscore=0 impostorscore=0 classifier=spam adjust=0
 reason=mlx scancount=1 engine=8.12.0-1910280000
 definitions=main-1912020096
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191202_023143_636831_CE2AD037 
X-CRM114-Status: GOOD (  26.82  )
X-BeenThere: linux-i3c@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux I3C <linux-i3c.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-i3c>,
 <mailto:linux-i3c-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-i3c/>
List-Post: <mailto:linux-i3c@lists.infradead.org>
List-Help: <mailto:linux-i3c-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-i3c>,
 <mailto:linux-i3c-request@lists.infradead.org?subject=subscribe>
Cc: linux-i3c@lists.infradead.org, bbrezillon@kernel.org, rafalc@cadence.com,
 vitor.soares@synopsys.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org

Hi Vitor,

I know you didn't like this solution to split i3c_master_register. Could
you look into that once again?

Without that, I'm not able to satisfy the use case when secondary master
is registered after ENEC(MR) received already. That time registration path
is little bit different. It may be the case that we don't receive next
ENEC(MR) and won't be able to register all the devices / complete bus
initialization.

As it's different, it's good practice to split that routine and let HC drivers
register it differently. Without that, i3c_master_register becomes huge
and not readable, takes too many responsibilities.

Anyway, I updated DW HC driver also in that patch. I remember you and
Boris mentioned I didn't do that.

Can we discuss that aproach?

The 06/22/2019 21:55, Przemyslaw Gaj wrote:
> This patch is base for mastership takeover where secondary master is
> initialized at probe time but register may be postponed till dynamic address is
> assigned to our device.
> 
> Signed-off-by: Przemyslaw Gaj <pgaj@cadence.com>
> ---
>  drivers/i3c/master.c                 | 86 ++++++++++++++++++++----------------
>  drivers/i3c/master/dw-i3c-master.c   | 34 +++++++-------
>  drivers/i3c/master/i3c-master-cdns.c | 45 ++++++++++---------
>  include/linux/i3c/master.h           | 12 ++---
>  4 files changed, 94 insertions(+), 83 deletions(-)
> 
> diff --git a/drivers/i3c/master.c b/drivers/i3c/master.c
> index 0f7c31e..759078f 100644
> --- a/drivers/i3c/master.c
> +++ b/drivers/i3c/master.c
> @@ -1528,32 +1528,9 @@ int i3c_master_do_daa(struct i3c_master_controller *master)
>  }
>  EXPORT_SYMBOL_GPL(i3c_master_do_daa);
>  
> -/**
> - * i3c_master_set_info() - set master device information
> - * @master: master used to send frames on the bus
> - * @info: I3C device information
> - *
> - * Set master device info. This should be called from
> - * &i3c_master_controller_ops->bus_init().
> - *
> - * Not all &i3c_device_info fields are meaningful for a master device.
> - * Here is a list of fields that should be properly filled:
> - *
> - * - &i3c_device_info->dyn_addr
> - * - &i3c_device_info->bcr
> - * - &i3c_device_info->dcr
> - * - &i3c_device_info->pid
> - * - &i3c_device_info->hdr_cap if %I3C_BCR_HDR_CAP bit is set in
> - *   &i3c_device_info->bcr
> - *
> - * This function must be called with the bus lock held in maintenance mode.
> - *
> - * Return: 0 if @info contains valid information (not every piece of
> - * information can be checked, but we can at least make sure @info->dyn_addr
> - * and @info->bcr are correct), -EINVAL otherwise.
> - */
> -int i3c_master_set_info(struct i3c_master_controller *master,
> -			const struct i3c_device_info *info)
> +static int i3c_master_set_info(struct i3c_master_controller *master,
> +			       const struct i3c_device_info *info,
> +			       bool secondary)
>  {
>  	struct i3c_dev_desc *i3cdev;
>  	int ret;
> @@ -1586,7 +1563,6 @@ int i3c_master_set_info(struct i3c_master_controller *master,
>  
>  	return ret;
>  }
> -EXPORT_SYMBOL_GPL(i3c_master_set_info);
>  
>  static void i3c_master_detach_free_devs(struct i3c_master_controller *master)
>  {
> @@ -2403,7 +2379,7 @@ static int i3c_master_check_ops(const struct i3c_master_controller_ops *ops)
>  }
>  
>  /**
> - * i3c_master_register() - register an I3C master
> + * i3c_master_init() - initializes all the structures required by I3C master
>   * @master: master used to send frames on the bus
>   * @parent: the parent device (the one that provides this I3C master
>   *	    controller)
> @@ -2417,16 +2393,14 @@ static int i3c_master_check_ops(const struct i3c_master_controller_ops *ops)
>   * - creates and initializes the I3C bus
>   * - populates the bus with static I2C devs if @parent->of_node is not
>   *   NULL
> - * - registers all I3C devices added by the controller during bus
> - *   initialization
> - * - registers the I2C adapter and all I2C devices
> + * - set bus mode when registering I2C devices.
>   *
>   * Return: 0 in case of success, a negative error code otherwise.
>   */
> -int i3c_master_register(struct i3c_master_controller *master,
> -			struct device *parent,
> -			const struct i3c_master_controller_ops *ops,
> -			bool secondary)
> +int i3c_master_init(struct i3c_master_controller *master,
> +		    struct device *parent,
> +		    const struct i3c_master_controller_ops *ops,
> +		    bool secondary)
>  {
>  	struct i3c_bus *i3cbus = i3c_master_get_bus(master);
>  	enum i3c_bus_mode mode = I3C_BUS_MODE_PURE;
> @@ -2488,10 +2462,47 @@ int i3c_master_register(struct i3c_master_controller *master,
>  		ret = -ENOMEM;
>  		goto err_put_dev;
>  	}
> +	return 0;
> +
> +err_put_dev:
> +	put_device(&master->dev);
> +
> +	return ret;
> +}
> +EXPORT_SYMBOL_GPL(i3c_master_init);
> +
> +void i3c_master_cleanup(struct i3c_master_controller *master)
> +{
> +	put_device(&master->dev);
> +}
> +EXPORT_SYMBOL_GPL(i3c_master_cleanup);
> +
> +/**
> + * i3c_master_register() - register an primary I3C master
> + * @master: master used to send frames on the bus
> + * @info: master info, describes this device
> + *
> + * This function takes care of everything for you:
> + *
> + * - updates this master info
> + * - registers all I3C devices added by the controller during bus
> + *   initialization
> + * - registers the I2C adapter and all I2C devices
> + *
> + * Return: 0 in case of success, a negative error code otherwise.
> + */
> +int i3c_master_register(struct i3c_master_controller *master,
> +			struct i3c_device_info *info)
> +{
> +	int ret;
> +
> +	ret = i3c_master_set_info(master, info, master->secondary);
> +	if (ret)
> +		return ret;
>  
>  	ret = i3c_master_bus_init(master);
>  	if (ret)
> -		goto err_put_dev;
> +		return ret;
>  
>  	ret = device_add(&master->dev);
>  	if (ret)
> @@ -2522,9 +2533,6 @@ int i3c_master_register(struct i3c_master_controller *master,
>  err_cleanup_bus:
>  	i3c_master_bus_cleanup(master);
>  
> -err_put_dev:
> -	put_device(&master->dev);
> -
>  	return ret;
>  }
>  EXPORT_SYMBOL_GPL(i3c_master_register);
> diff --git a/drivers/i3c/master/dw-i3c-master.c b/drivers/i3c/master/dw-i3c-master.c
> index 22ac305..8e91364 100644
> --- a/drivers/i3c/master/dw-i3c-master.c
> +++ b/drivers/i3c/master/dw-i3c-master.c
> @@ -593,7 +593,6 @@ static int dw_i3c_master_bus_init(struct i3c_master_controller *m)
>  {
>  	struct dw_i3c_master *master = to_dw_i3c_master(m);
>  	struct i3c_bus *bus = i3c_master_get_bus(m);
> -	struct i3c_device_info info = { };
>  	u32 thld_ctrl;
>  	int ret;
>  
> @@ -623,20 +622,6 @@ static int dw_i3c_master_bus_init(struct i3c_master_controller *m)
>  	writel(INTR_MASTER_MASK, master->regs + INTR_STATUS_EN);
>  	writel(INTR_MASTER_MASK, master->regs + INTR_SIGNAL_EN);
>  
> -	ret = i3c_master_get_free_addr(m, 0);
> -	if (ret < 0)
> -		return ret;
> -
> -	writel(DEV_ADDR_DYNAMIC_ADDR_VALID | DEV_ADDR_DYNAMIC(ret),
> -	       master->regs + DEVICE_ADDR);
> -
> -	memset(&info, 0, sizeof(info));
> -	info.dyn_addr = ret;
> -
> -	ret = i3c_master_set_info(&master->base, &info);
> -	if (ret)
> -		return ret;
> -
>  	writel(IBI_REQ_REJECT_ALL, master->regs + IBI_SIR_REQ_REJECT);
>  	writel(IBI_REQ_REJECT_ALL, master->regs + IBI_MR_REQ_REJECT);
>  
> @@ -1109,6 +1094,7 @@ static int dw_i3c_probe(struct platform_device *pdev)
>  {
>  	struct dw_i3c_master *master;
>  	struct resource *res;
> +	struct i3c_device_info info = { };
>  	int ret, irq;
>  
>  	master = devm_kzalloc(&pdev->dev, sizeof(*master), GFP_KERNEL);
> @@ -1160,8 +1146,22 @@ static int dw_i3c_probe(struct platform_device *pdev)
>  	master->maxdevs = ret >> 16;
>  	master->free_pos = GENMASK(master->maxdevs - 1, 0);
>  
> -	ret = i3c_master_register(&master->base, &pdev->dev,
> -				  &dw_mipi_i3c_ops, false);
> +	ret = i3c_master_init(&master->base, &pdev->dev,
> +			      &dw_mipi_i3c_ops, false);
> +	if (ret)
> +		goto err_assert_rst;
> +
> +	ret = i3c_master_get_free_addr(&master->base, 0);
> +	if (ret < 0)
> +		goto err_assert_rst;
> +
> +	writel(DEV_ADDR_DYNAMIC_ADDR_VALID | DEV_ADDR_DYNAMIC(ret),
> +	       master->regs + DEVICE_ADDR);
> +
> +	memset(&info, 0, sizeof(info));
> +	info.dyn_addr = ret;
> +
> +	ret = i3c_master_register(&master->base, &info);
>  	if (ret)
>  		goto err_assert_rst;
>  
> diff --git a/drivers/i3c/master/i3c-master-cdns.c b/drivers/i3c/master/i3c-master-cdns.c
> index 5aee315..9706426 100644
> --- a/drivers/i3c/master/i3c-master-cdns.c
> +++ b/drivers/i3c/master/i3c-master-cdns.c
> @@ -1193,8 +1193,7 @@ static int cdns_i3c_master_bus_init(struct i3c_master_controller *m)
>  	unsigned long pres_step, sysclk_rate, max_i2cfreq;
>  	struct i3c_bus *bus = i3c_master_get_bus(m);
>  	u32 ctrl, prescl0, prescl1, pres, low;
> -	struct i3c_device_info info = { };
> -	int ret, ncycles;
> +	int ncycles;
>  
>  	switch (bus->mode) {
>  	case I3C_BUS_MODE_PURE:
> @@ -1247,22 +1246,6 @@ static int cdns_i3c_master_bus_init(struct i3c_master_controller *m)
>  	prescl1 = PRESCL_CTRL1_OD_LOW(ncycles);
>  	writel(prescl1, master->regs + PRESCL_CTRL1);
>  
> -	/* Get an address for the master. */
> -	ret = i3c_master_get_free_addr(m, 0);
> -	if (ret < 0)
> -		return ret;
> -
> -	writel(prepare_rr0_dev_address(ret) | DEV_ID_RR0_IS_I3C,
> -	       master->regs + DEV_ID_RR0(0));
> -
> -	cdns_i3c_master_dev_rr_to_info(master, 0, &info);
> -	if (info.bcr & I3C_BCR_HDR_CAP)
> -		info.hdr_cap = I3C_CCC_HDR_MODE(I3C_HDR_DDR);
> -
> -	ret = i3c_master_set_info(&master->base, &info);
> -	if (ret)
> -		return ret;
> -
>  	/*
>  	 * Enable Hot-Join, and, when a Hot-Join request happens, disable all
>  	 * events coming from this device.
> @@ -1531,6 +1514,7 @@ static int cdns_i3c_master_probe(struct platform_device *pdev)
>  {
>  	struct cdns_i3c_master *master;
>  	struct resource *res;
> +	struct i3c_device_info info = { };
>  	int ret, irq;
>  	u32 val;
>  
> @@ -1606,13 +1590,32 @@ static int cdns_i3c_master_probe(struct platform_device *pdev)
>  	writel(MST_INT_IBIR_THR, master->regs + MST_IER);
>  	writel(DEVS_CTRL_DEV_CLR_ALL, master->regs + DEVS_CTRL);
>  
> -	ret = i3c_master_register(&master->base, &pdev->dev,
> -				  &cdns_i3c_master_ops, false);
> +	ret = i3c_master_init(&master->base, &pdev->dev, &cdns_i3c_master_ops, false);
>  	if (ret)
> -		goto err_disable_sysclk;
> +	goto err_disable_sysclk;
> +
> +	/* Get an address for the master. */
> +	ret = i3c_master_get_free_addr(&master->base, 0);
> +	if (ret < 0)
> +		return ret;
> +
> +	writel(prepare_rr0_dev_address(ret) | DEV_ID_RR0_IS_I3C,
> +	       master->regs + DEV_ID_RR0(0));
> +
> +	cdns_i3c_master_dev_rr_to_info(master, 0, &info);
> +	if (info.bcr & I3C_BCR_HDR_CAP)
> +		info.hdr_cap = I3C_CCC_HDR_MODE(I3C_HDR_DDR);
> +
> +	ret = i3c_master_register(&master->base, &info);
> +
> +	if (ret)
> +		goto err_cleanup;
>  
>  	return 0;
>  
> +err_cleanup:
> +	i3c_master_cleanup(&master->base);
> +
>  err_disable_sysclk:
>  	clk_disable_unprepare(master->sysclk);
>  
> diff --git a/include/linux/i3c/master.h b/include/linux/i3c/master.h
> index 42bb215..df3d769 100644
> --- a/include/linux/i3c/master.h
> +++ b/include/linux/i3c/master.h
> @@ -530,13 +530,13 @@ int i3c_master_add_i3c_dev_locked(struct i3c_master_controller *master,
>  				  u8 addr);
>  int i3c_master_do_daa(struct i3c_master_controller *master);
>  
> -int i3c_master_set_info(struct i3c_master_controller *master,
> -			const struct i3c_device_info *info);
> -
> +int i3c_master_init(struct i3c_master_controller *master,
> +		    struct device *parent,
> +		    const struct i3c_master_controller_ops *ops,
> +		    bool secondary);
> +void i3c_master_cleanup(struct i3c_master_controller *master);
>  int i3c_master_register(struct i3c_master_controller *master,
> -			struct device *parent,
> -			const struct i3c_master_controller_ops *ops,
> -			bool secondary);
> +			struct i3c_device_info *info);
>  int i3c_master_unregister(struct i3c_master_controller *master);
>  
>  /**
> -- 
> 2.4.5
> 

-- 
--
Regards,
Przemek

_______________________________________________
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
