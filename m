Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D64ACD343F
	for <linux-i3c@archiver.kernel.org>; Tue, 12 May 2026 18:16:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YBzwcVXix/B6PIS0hqzcUTjRt7v+JHPmQhlGOub5B7Y=; b=Ga/wjSeVYUrXb+
	eGLzwJ5Mi08h1gKE0y93wS2qI2SylbDms32Q1yC8nijDQQ0qN6WlTcJFo76uUtz51i71RD3klD2+I
	axE6q+X6nYeiQBTWuG2Dukfyu9YEqfworz2E/1jxKgeV/AtX9aCxhYAwyZeSbsu12por0XVCnIMH7
	r1/VxKvZdV92hVhkgPJZngb4x7Wsu/VTAMjqd9NNPhp8LPCIsaNE3D+MRxcUu2x+r7N5iQxn1eOQf
	qgJtzC0ak8zChlC5qnA9BOFn4Fp0183VJbEYc6IDJpfY9IDSIrQqtMZBMOX6OJX/nDox4CZZw5nrI
	TJBiipa4W1OsR3FFnYFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMreE-000000004DH-0ZQx;
	Tue, 12 May 2026 18:16:02 +0000
Received: from mail-westeuropeazon11010039.outbound.protection.outlook.com ([52.101.69.39] helo=AM0PR83CU005.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMreC-000000004Cl-0otO
	for linux-i3c@lists.infradead.org;
	Tue, 12 May 2026 18:16:01 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=c6qCKqd+Nal5nagzCwBeBWsnp4UuogTtndif+HD4HRkdGvewyzaOXjI5EP9tBt7q2Z/O+J0+rW75KK4BMIyZnqtZMMiS6EOFaAbN6vePRhA/tgoYp9tWsxna9WH3YJjrZ9z8rW6ApRcd4YVlfIHCWnJvjvsqTHkUMQMesZQ9I9zlLU1ckJP+DVM0iEvEOlEfen4gN3C6YfOAtnl4oLA1ySWQ1LxMiQHnDbXDUtYtiKAyRtbd2Vkr/hJM39JR6rmo4gX0Y0yrVEv2D9ziZMmcJYw3HYIbaBWY5IfrttR53mH6aAvKPP+kEc1aDDcZ1qgRm9w7BHG+n3epN5XcshznBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tWt0k+YjvA4pLLmT4IzTjzyX88xGpfWZq7L4lrBF4xU=;
 b=buKif64/sANvyY9bAd2Y8aVONhRo2+BGnt49V3gwf5bKWn90Usuo2Pfyq7odQaMWkdDvInfdZ9VPAgxK69plKWMmy8+qKb/ZEqj+uvsWfKVBSWjRj+2HXOWDrudK/EsIIW4zkE+bsG6Dgc1Zsi/Wrfe6D/CZWbb8FAghqbrW1SFi6I5FUWfbL08YolvqM+oNeM0zRHrAvIVUSgznyZuhBeMhYotCxpeNKVtyD7PBFfMgqLjEA1l4WnG2xBMgYdSx5vO6eleUD7kk65Z4Ze38A3wMTnA1zGp8j+06q3vvgIEozRQd9F//VY9bn4mmIqV30KYdV2A5K9TXWeKv2u4S6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tWt0k+YjvA4pLLmT4IzTjzyX88xGpfWZq7L4lrBF4xU=;
 b=WgsUqGFzKn7TJNPIdxNyIw2q8MSgFBi8Ljp5fuzpHcOj1baMWlDmgTuwLU8L4j3N3IHhWhbVkkMP9ocJUYfoRtd05wtfZNX2fGRFDGkI8tYZtpAyorOMKbH47IcGbMDv5q9yT5heqRVRGfw8/txFJHOGdciVE7vuJuqi1IDQ3U1x+9KRqFF/+UX7Xi9gAxVzVJV4Vs0oq37IdudNhdl8JZHGc9iVTuoJ6mJb43ernglLArxDXcS3blRdjBRo6WvmF8v7S/AMj29MW2dE5xo+GoSfO+EsQQPYYFnu75/N06nlSDDhpZKGuK0OjGBeOxMQtL3qTzLcEYdYgitFZBLeqw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by GVXPR04MB10082.eurprd04.prod.outlook.com (2603:10a6:150:1b5::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9913.11; Tue, 12 May
 2026 18:15:56 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%3]) with mapi id 15.20.9891.021; Tue, 12 May 2026
 18:15:56 +0000
Date: Tue, 12 May 2026 14:15:49 -0400
From: Frank Li <Frank.li@nxp.com>
To: Adrian Hunter <adrian.hunter@intel.com>
Cc: alexandre.belloni@bootlin.com, linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH V3 16/16] i3c: mipi-i3c-hci: Increase DMA transfer ring
 size to maximum
Message-ID: <agNuVdGTXqFxUx0J@lizhi-Precision-Tower-5810>
References: <20260504113352.38490-1-adrian.hunter@intel.com>
 <20260504113352.38490-17-adrian.hunter@intel.com>
Content-Disposition: inline
In-Reply-To: <20260504113352.38490-17-adrian.hunter@intel.com>
X-ClientProxiedBy: SN7P222CA0025.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:806:124::35) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|GVXPR04MB10082:EE_
X-MS-Office365-Filtering-Correlation-Id: 4648f313-1ab5-45b2-9748-08deb05282aa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|19092799006|52116014|376014|1800799024|38350700014|56012099003|22082099003|18002099003|11063799003;
X-Microsoft-Antispam-Message-Info: Ps1hLFCkq0NPMtPZpb9VdnPXGKPk1f96M80lxXiAWcPIhj4teVzfJVR1amBklR1lNGAlLNhc9qui1SY0JeFeQbP0oAyEBIvOmJrn7gJyRIbvZxYJ4k+MwLRKEpGzvUYMlNmqlqCfnb4FeSWK2V62J5hQy80gy7hkQJaT/HH8SJWEo1+uqd/8kZMWJ7go9hL1U4HLhFsXQ8I0TlwymR40wsNbHlyy9lm+1p2i9hhEXioJmoFIC5MuXTKpE+Klh6XssE3C5RZ9j901MxCuDwroPFCEUMwO8u+TIl4TAW5MKbw7pO2XwpHEGjj3y8BC9r06jpxE8z3xPlR9uABFkjENwSvzyzH1kR7fGmDZluQDMu+873s91ZOJnksQIZxeeBMqBftPs0YGzAg9Uqr58j7ETP3I9iZdnmKVtaq3TX1bDADSUZ5IWRxNWCXwY4P156Pbz5CTCpnPZVEkcI3vaWPpidU8xwhQfArHtFkKBuJC5tvyac3tTm460+H6t91AxmGIODFU2WHuRSD0IFqrqDwMun+Rr2pe2C/KZ54ppvZER2GWBJO1br7dxUs7Sm1Yr4BYj3E+oL9g/AhCtzbSKBvAxy0+GUUZS3qic9Ei0M7qeEoB3+Q/27/+mIHOkwR5ZDZy68oGq80V+ljp2taZ7Hdeiz/8xxJC00L80MRXQWh9MRqYWIxr4kO5jFtYeeHjU5ptYwxKWlwbWNlyyaCqD0f9J0XEPpuvGUJ/Rwr/lIvR73qgAsge5xyG3B2shVfW1ozb
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(19092799006)(52116014)(376014)(1800799024)(38350700014)(56012099003)(22082099003)(18002099003)(11063799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?mFnpIzMMt831Yc57vuUWGCoxhSJ/3m6l0kqlJ9CGXkOeYqYbGffuQ+HCA9t4?=
 =?us-ascii?Q?84C7P7VuH7HGr0bB6V7hIL8QzoHNBtaF6KzbmfpYKYbwzpdt8/Jqo87f3ZI6?=
 =?us-ascii?Q?cvouqItwMzCZn1Z75uBkyny1blrSs2YBkFj8Q+KQ2u3s82ODzY+jjHsM67c9?=
 =?us-ascii?Q?8mpCfaG8eSqWnMLL8Wye2JFj0oba+327zoxC7RYQirvXxCAXfL4gFxBqKldY?=
 =?us-ascii?Q?tzxjGjnPsdph4dikTsEnU8vXnaCkACcDSczcmDM+FLqvM1HvqFguWbmud53y?=
 =?us-ascii?Q?fqoG6YILRU5Mil2auQt0ENbICmOyNTLueqFbMFnbOTWjzbeU0TlEmdWKv8mU?=
 =?us-ascii?Q?zMrLfPjXepGfFUIkdL5tnZSRoNC48uJmdG5RFypR+5gJ1FWy8CWtYgrb9H8U?=
 =?us-ascii?Q?g5WNTMVYNfHQJUr6yQXwl7olMsmHTDlabqt4aXaOg6p0H9EOpOp0/sSCzLFU?=
 =?us-ascii?Q?QogWnOq5pAOodCYoPmhpDcpKKp5M+JhtGFxov2Q5CYZEyIGy8fXG7AVTXoqU?=
 =?us-ascii?Q?83LVrK+I3Eeht9M4dtaxRZnaQJa+zjhST7tttp2f7WSyL99WVgVt5UIAinlO?=
 =?us-ascii?Q?J/MMWdN/JqZJ5PvM2xfhwcQM/ARBl3PP6HxA85c6atllzeJDlFtW1C1GrJii?=
 =?us-ascii?Q?gq5jdw2JCEGPebMGeROx/b5mQkYUN8w5Aw653at1QQSKWnP5wkeYtNr3vOt9?=
 =?us-ascii?Q?pW4jWOInZ9yyt8sfAHq17j8P9/iGS7/8kVF21SkBab8NV3ln5DrJc9DcXfGZ?=
 =?us-ascii?Q?iDsJBoEUOSE8sqfIoYhYjHJVGBncUbXyeLNptNDe7KE9aOTZ0qhuRcLZTzj1?=
 =?us-ascii?Q?8cCS6NPGH6TrLNRWlyvYxSEjfIMfLKBLsLqLv+LnniKJnRVJPntjdl9HDRLs?=
 =?us-ascii?Q?dwjlYTIRKEGoGlc73ZSSQHtXUnRVqEngufzsnI85Ftt+H38y0iO/UdFC2ODg?=
 =?us-ascii?Q?fz0bFTWdfhqGJp7TkS6fB1FzYjsl6G8o8kopbBFn/qWxBACPu7gy/rP0hPrK?=
 =?us-ascii?Q?6Y8yTU/TsTf09WSkehmjSc2sBx8VLpBbnzyGBbb9OuTxnuzMG1+7WfFnG4LY?=
 =?us-ascii?Q?9NcAg+QiLqTro7xTzp7b6Qp5Ibdn+k6t2z7zjynScJStiHzTuYC33kZdWRvw?=
 =?us-ascii?Q?xYASV+TVWTVwsDz+kEjc4sdIzCV6FKlL2Xu4PKg+2mB3QiOSQBxtw7fHCh73?=
 =?us-ascii?Q?Cb4mmwSBFehojbOCQ8HCtG5yvr6VlZuAbGWKl9Kql7ntUJOWZ401mAjczOFQ?=
 =?us-ascii?Q?yMpfyuOObiwRpUMbvlnYvA8TTSM55cb7L5/2Yuf++LUePGQby/E+CHKU6Ya+?=
 =?us-ascii?Q?BSfYo3vzkAQMGIendZnwaDZZmO4laBTyVwjo+J09xjNg4mxC5mmIex/VWoTd?=
 =?us-ascii?Q?Xc5ZOvIwxYI9WOJThWnkZ73pd+bsKdmwNoBUl1oT0HLkVFMfVyqpacTlpZ5K?=
 =?us-ascii?Q?6Z/eeJScbuyP4EQAPTcSv4F0sGsNIcCEADYAtHS1Ob+ainBkGfQanETlTq90?=
 =?us-ascii?Q?YfV5SBPM/NbZj2QLcpcrRYI2b8Qt8FZDEOlpROSlFjVrxpUdFZGIpLkO/tQN?=
 =?us-ascii?Q?N6tM15oWBvZFxPQhnCjryfj83wH68GSnFkixexYvRE7YXsPWjMJulUL37/eP?=
 =?us-ascii?Q?iLIQLybgdSDKdHRj/xhomy8p2rTEG7SzedWotYuwJqhgVdUjWzJJ7ad6sejV?=
 =?us-ascii?Q?4pn7Fm1Xadkvccn7fOqNOu+9e+QYHiq3oS+FmZpY6g0L8OgWwlqnRYAD9ben?=
 =?us-ascii?Q?DaxThbphIQ=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4648f313-1ab5-45b2-9748-08deb05282aa
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 May 2026 18:15:56.1356
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gHXtKx0MYXA877dPkJafT12Tf0AcgBY5rQ+uVuu1VSFJyWO0pRkPT8CL3jm/8iOgZRLclYCL1k6ivDf1GE9sEQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB10082
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260512_111600_235583_2CBD4715 
X-CRM114-Status: GOOD (  17.85  )
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

On Mon, May 04, 2026 at 02:33:52PM +0300, Adrian Hunter wrote:
> The DMA transfer ring is currently limited to 16 entries, despite the
> MIPI I3C HCI supporting up to 32 devices.  When the ring lacks space for a
> new transfer list, the driver returns -EBUSY, which can be unexpected
> for clients.
>
> Increase the DMA transfer ring size to the maximum supported value of
> 255 entries.  This effectively eliminates ring-space exhaustion in
> practice and avoids the complexity of adding secondary queuing
> mechanisms.
>
> Even at the maximum size, the memory overhead remains small
> (approximately 24 bytes per entry by default).
>
> Signed-off-by: Adrian Hunter <adrian.hunter@intel.com>
> ---
Reviewed-by: Frank Li <Frank.Li@nxp.com>
>
>
> Changes in V2 and V3:
>
> 	None
>
>
>  drivers/i3c/master/mipi-i3c-hci/dma.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/i3c/master/mipi-i3c-hci/dma.c b/drivers/i3c/master/mipi-i3c-hci/dma.c
> index 4029d4d9e784..9549d98add4b 100644
> --- a/drivers/i3c/master/mipi-i3c-hci/dma.c
> +++ b/drivers/i3c/master/mipi-i3c-hci/dma.c
> @@ -27,7 +27,7 @@
>   */
>
>  #define XFER_RINGS			1	/* max: 8 */
> -#define XFER_RING_ENTRIES		16	/* max: 255 */
> +#define XFER_RING_ENTRIES		255	/* max: 255 */
>
>  #define IBI_RINGS			1	/* max: 8 */
>  #define IBI_STATUS_RING_ENTRIES		32	/* max: 255 */
> --
> 2.51.0
>

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
